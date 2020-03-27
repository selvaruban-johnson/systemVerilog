//sp_ram8x16
module sp_ram8x16(
    input clock,
    input [2:0] addr,
    input [15:0] d_in,
    output [15:0] d_out,
    input we
    );
   parameter ram_width = 16;
   parameter ram_addr_bits = 3;
   
   reg [ram_width-1:0] my_ram [(2**ram_addr_bits)-1:0];   

   always @(posedge clock)
      if (we)    
         my_ram[addr] <= d_in;
		        
			assign d_out = my_ram[addr];
     
endmodule




//arbiter_transaction
class env_sram_transaction;
rand bit [2:0]addr;
rand bit [15:0] d_in;
bit [15:0]d_out;
endclass



//interface
interface env_sram_interface (input bit clock,we);
bit [2:0]addr;
bit [15:0]d_in;
bit [15:0]d_out;
endinterface



// interface j
interface env_sram_rinterface (input bit clock,we);
bit [2:0]addr;
bit [15:0]d_in;
bit [15:0]d_out;
endinterface




//env_sram_generator
class env_sram_generator;
env_sram_transaction pkt;
mailbox #(env_sram_transaction)gen_drv;

function new (mailbox #(env_sram_transaction)gen_drv);
this.gen_drv=gen_drv;
endfunction

task run;
pkt=new();
assert(pkt.randomize())
begin
$display("Randomization successful.");
gen_drv.put(pkt);
end
else 
$display("Randomization failure.");
endtask
endclass



//driver
class env_sram_driver;
env_sram_transaction pkt;
mailbox #(env_sram_transaction)gen_drv;
virtual env_sram_interface i;
virtual env_sram_rinterface ri;

function new (mailbox #(env_sram_transaction)gen_drv,virtual env_sram_interface i,virtual env_sram_rinterface ri);
this.gen_drv=gen_drv;
this.i=i;
this.ri=ri;
endfunction

task run;
gen_drv.get(pkt);
i.addr=pkt.addr;
i.d_in=pkt.d_in;
ri.addr=pkt.addr;
ri.d_in=pkt.d_in;
endtask
endclass



//monitor
class env_sram_monitor;
env_sram_transaction pkt1,pkt2;
mailbox #(env_sram_transaction)mon_sb;
mailbox #(env_sram_transaction)mon_sb2;
virtual env_sram_interface i;
virtual env_sram_rinterface ri;

function new (mailbox #(env_sram_transaction)mon_sb,mailbox #(env_sram_transaction)mon_sb2,virtual env_sram_interface i,virtual env_sram_rinterface ri);
this.mon_sb=mon_sb;
this.mon_sb2=mon_sb2;
this.i=i;
this.ri=ri;
endfunction

task run;
pkt1=new();
pkt2=new();

pkt1.addr=i.addr;
pkt1.d_in=i.d_in;
pkt1.d_out=i.d_out;

pkt2.addr=ri.addr;
pkt2.d_in=ri.d_in;
pkt2.d_out=ri.d_out;

$display($time," pkt1.addr=%0b pkt1.d_in=%0b pkt1.d_out=%0b",pkt1.addr,pkt1.d_in,pkt1.d_out);
$display($time," pkt2.addr=%0b pkt2.d_in=%0b pkt2.d_out=%0b",pkt2.addr,pkt2.d_in,pkt2.d_out);

mon_sb.put(pkt1);
mon_sb2.put(pkt2);
endtask
endclass



//scoreboard
class env_sram_scoreboard;
env_sram_transaction pkt1,pkt2;
mailbox #(env_sram_transaction)mon_sb;
mailbox #(env_sram_transaction)mon_sb2;

function new(mailbox #(env_sram_transaction)mon_sb,mailbox #(env_sram_transaction)mon_sb2);
this.mon_sb=mon_sb;
this.mon_sb2=mon_sb2;
endfunction

task run;
mon_sb.get(pkt1);
mon_sb2.get(pkt2);
if(pkt1.d_out==pkt2.d_out)
begin
$display("Design is okay.");
end
else
begin
$display("Design is not okay.");
end
endtask
endclass


//coverage
class env_sram_coverage;
virtual env_sram_interface i;

covergroup cg @(posedge i.clock);
sram_d_in_CP: coverpoint i.d_in{ignore_bins d_in1 = {16'h32};}
sram_d_out_CP: coverpoint i.d_out{illegal_bins d_out1 = {16'h22}; bins d_out2 = {16'hx};}
sram_addr_CP: coverpoint i.addr {bins addr1 = {3'd7};}
//sram_we_CP: cross i.we;
endgroup

function new (virtual env_sram_interface i);
this.i=i;
cg=new();
endfunction

task sample();
cg.sample();
endtask
endclass



//environment
class env_sram_environment;
mailbox #(env_sram_transaction)gen_drv;
mailbox #(env_sram_transaction)mon_sb;
mailbox #(env_sram_transaction)mon_sb2;
virtual env_sram_interface i;
virtual env_sram_rinterface ri;
env_sram_generator g1;
env_sram_driver d1;
env_sram_monitor m1;
env_sram_coverage c1;
env_sram_scoreboard s1;

function new (virtual env_sram_interface i,virtual env_sram_rinterface ri);
this.i=i;
this.ri=ri;
endfunction

function build;
gen_drv=new();
mon_sb=new();
mon_sb2=new();
g1=new(gen_drv);
d1=new(gen_drv,i,ri);
m1=new(mon_sb,mon_sb2,i,ri);
s1=new(mon_sb,mon_sb2);
c1=new(i);
endfunction

task run;
fork
g1.run();
d1.run();
c1.sample();
m1.run();
s1.run();
join
endtask
endclass



//test
module env_sram_test(env_sram_interface i,env_sram_rinterface ri);
env_sram_environment en;

initial
begin
en=new(i,ri);
en.build();
repeat(20000)
begin
#10 en.run();
end
end
endmodule



//top
module sp_ram8x16_top_architecture_2;
bit clock,we;

//Clock generation
initial
begin 
clock = 1'b0;
forever
#5 clock = ~clock;
end

//Reset generation
initial 
begin
we=1'b1;
#10;
we=1'b0;
#50;
we=1'b1;
#10;
we=1'b0;
end

env_sram_interface i(clock,we);
env_sram_rinterface ri(clock,we);
env_sram_test T(i,ri);
 
sp_ram8x16 sp1(.clock(clock),.we(we),.addr(i.addr),.d_in(i.d_in),.d_out(i.d_out));


endmodule
