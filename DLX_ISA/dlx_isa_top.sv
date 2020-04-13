//DLX_ISA_Mosule
`include "topmodule.sv"
//transaction
class packet;
//rand bit enable_ex;
rand bit [31:0]src1,src2,imm,mem_data_read_in;
rand bit [6:0]control_in;
bit [31:0]aluout,mem_data_write_out;
bit carry,mem_data_write_en;
endclass



//interface
interface intf_i (input bit clk,reset,enable_ex);
//bit enable_ex;
bit [31:0]src1,src2,imm,mem_data_read_in;
bit [6:0]control_in;
bit [31:0]aluout,mem_data_write_out;
bit carry,mem_data_write_en;
endinterface



// interface j
interface intf_j (input bit clk,reset,enable_ex);
//bit enable_ex;
bit [31:0]src1,src2,imm,mem_data_read_in;
bit [6:0]control_in;
bit [31:0]aluout,mem_data_write_out;
bit carry,mem_data_write_en;
endinterface



//generator
class generator;
packet pkt;
mailbox #(packet)gen_drv;

function new (mailbox #(packet)gen_drv);
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
class driver;
packet pkt;
mailbox #(packet)gen_drv;
virtual intf_i i;
virtual intf_j j;

function new (mailbox #(packet)gen_drv,virtual intf_i i,virtual intf_j j);
this.gen_drv=gen_drv;
this.i=i;
this.j=j;
endfunction

task run;
gen_drv.get(pkt);
i.src1=pkt.src1;
i.src2=pkt.src2;
i.imm = pkt.imm;
i.mem_data_read_in = pkt.mem_data_read_in;
i.control_in = pkt.control_in;

j.src1=pkt.src1;
j.src2=pkt.src2;
j.imm = pkt.imm;
j.mem_data_read_in = pkt.mem_data_read_in;
j.control_in = pkt.control_in;
endtask
endclass



//monitor
class monitor;
packet pkt1,pkt2;
mailbox #(packet)mon_sb;
mailbox #(packet)mon_sb2;
virtual intf_i i;
virtual intf_j j;

function new (mailbox #(packet)mon_sb,mailbox #(packet)mon_sb2,virtual intf_i i,virtual intf_j j);
this.mon_sb=mon_sb;
this.mon_sb2=mon_sb2;
this.i=i;
this.j=j;
endfunction

task run;
pkt1=new();
pkt2=new();


pkt1.src1=i.src1;
pkt1.src2=i.src2;
pkt1.imm = i.imm;
pkt1.mem_data_read_in = i.mem_data_read_in;
pkt1.control_in = i.control_in;
pkt1.aluout = i.aluout;
pkt1.mem_data_write_out=i.mem_data_write_out;
pkt1.carry=i.carry;
pkt1.mem_data_write_en=i.mem_data_write_en;

pkt2.src1=j.src1;
pkt2.src2=j.src2;
pkt2.imm = j.imm;
pkt2.mem_data_read_in = j.mem_data_read_in;
pkt2.control_in = j.control_in;
pkt2.aluout = j.aluout;
pkt2.mem_data_write_out=j.mem_data_write_out;
pkt2.carry=j.carry;
pkt2.mem_data_write_en=j.mem_data_write_en;


$display($time," pkt1.src1=%0b pkt1.src2=%0b pkt1.imm=%0b pkt1.mem_data_read_in=%0b pkt1.control_in=%0b pkt1.aluout=%0b pkt1.mem_data_write_out =%0b pkt1.carry = %0b pkt1.mem_data_write_en=%0b",pkt1.src1,pkt1.src2,pkt1.imm,pkt1.mem_data_read_in,pkt1.control_in,pkt1.aluout,pkt1.mem_data_write_out,pkt1.carry,pkt1.mem_data_write_en);
$display($time," pkt2.src1=%0b pkt2.src2=%0b pkt2.imm=%0b pkt2.mem_data_read_in=%0b pkt2.control_in=%0b pkt2.aluout=%0b pkt2.mem_data_write_out =%0b pkt2.carry = %0b pkt2.mem_data_write_en=%0b",pkt2.src1,pkt2.src2,pkt2.imm,pkt2.mem_data_read_in,pkt2.control_in,pkt2.aluout,pkt2.mem_data_write_out,pkt2.carry,pkt2.mem_data_write_en);


mon_sb.put(pkt1);
mon_sb2.put(pkt2);
endtask
endclass



//scoreboard
class scoreboard;
packet pkt1,pkt2;
mailbox #(packet)mon_sb;
mailbox #(packet)mon_sb2;

function new(mailbox #(packet)mon_sb,mailbox #(packet)mon_sb2);
this.mon_sb=mon_sb;
this.mon_sb2=mon_sb2;
endfunction

task run;
mon_sb.get(pkt1);
mon_sb2.get(pkt2);

assert((pkt1.aluout==pkt2.aluout)||(pkt1.mem_data_write_out==pkt2.mem_data_write_out)||(pkt1.carry==pkt2.carry)||(pkt1.mem_data_write_en==pkt2.mem_data_write_en))
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
class coverage;
virtual intf_i i;

covergroup cg @(posedge i.clk);

//enable_ex1:coverpoint i.enable_ex;
src11:coverpoint i.src1;
src21:coverpoint i.src2;
imm1:coverpoint i.imm;
m_d_r_i:coverpoint i.mem_data_read_in;
c_in:coverpoint i.control_in {bins c1={[0:128]};}
out:coverpoint i.aluout;
m_d_w_r:coverpoint i.mem_data_write_out;
carry1:coverpoint i.carry;
m_d_wr_en:coverpoint i.mem_data_write_en;

endgroup

function new (virtual intf_i i);
this.i=i;
cg=new();
endfunction

task sample();
cg.sample();
endtask
endclass



//environment
class environment;
mailbox #(packet)gen_drv;
mailbox #(packet)mon_sb;
mailbox #(packet)mon_sb2;
virtual intf_i i;
virtual intf_j j;
generator g1;
driver d1;
monitor m1;
coverage c1;
scoreboard s1;

function new (virtual intf_i i,virtual intf_j j);
this.i=i;
this.j=j;
endfunction

function build;
gen_drv=new();
mon_sb=new();
mon_sb2=new();
g1=new(gen_drv);
d1=new(gen_drv,i,j);
m1=new(mon_sb,mon_sb2,i,j);
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
module test(intf_i i,intf_j j);
environment en;

initial
begin
en=new(i,j);
en.build();
repeat(20000)
begin
#10 en.run();
end
end
endmodule



//top
module dlx_isa_top;
bit clk,reset,enable_ex;

//Clock generation
initial
begin 
clk = 1'b0;
forever
#5 clk = ~clk;
end

//Reset generation
initial 
begin
reset=1'b1;
enable_ex = 1'b1;
#10;
reset=1'b0;
enable_ex = 1'b0;
#10 enable_ex=1'b1;
#10 enable_ex=1'b0;
#50;
reset=1'b1;
enable_ex = 1'b1;

end

intf_i i(clk,reset,enable_ex);
intf_j j(clk,reset,enable_ex);
test T(i,j);
 
topmodule T1(.clk,.reset,.enable_ex,.src1(i.src1),.src2(i.src2),.imm(i.imm),.mem_data_read_in(i.mem_data_read_in),
.control_in(i.control_in),.aluout(i.aluout),.mem_data_write_out(i.mem_data_write_out),.carry(i.carry),.mem_data_write_en(i.mem_data_write_en));

topmodule T2(.clk,.reset,.enable_ex,.src1(j.src1),.src2(j.src2),.imm(j.imm),.mem_data_read_in(j.mem_data_read_in),
.control_in(j.control_in),.aluout(j.aluout),.mem_data_write_out(j.mem_data_write_out),.carry(j.carry),.mem_data_write_en(j.mem_data_write_en));

endmodule
