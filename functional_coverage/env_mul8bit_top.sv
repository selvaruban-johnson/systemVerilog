//multiplier
module mul8bit_rp
(output reg [15:0]out,
input [7:0] a,b);
reg [15:0]temp;
integer i;
always@(a,b)
begin
out=b[0]?{1'b0,a,7'b0}:15'd0;
for(i=1;i<8;i=i+1)
begin
if(b[i])
begin
temp=out>>1'b1;
out=temp+{1'b0,a,7'b0};
end
else
begin
temp=out>>1'b1;
out= temp;
end
end
end
endmodule

//class
class packet;
randc bit [7:0]a,b;
bit [15:0]out;
endclass

//interface 
interface intf;
bit [7:0]a,b;
bit [15:0]out;
modport drv(output a,b);
modport mon(input out);
endinterface

//generator
class generator;
packet pkt;
mailbox #(packet)gen_drv;
function new(mailbox #(packet)gen_drv);
this.gen_drv=gen_drv;
endfunction
task run;
pkt=new();
assert(pkt.randomize())
gen_drv.put(pkt);
else $display("randomization failed");
endtask
endclass

//driver
class driver;
packet pkt;
mailbox #(packet)gen_drv;
mailbox #(packet)drv_sb;
virtual intf i;
function new(mailbox #(packet)gen_drv,mailbox
#(packet)drv_sb,virtual intf i);
this.gen_drv=gen_drv;
this.drv_sb=drv_sb;
this.i=i;
endfunction
task run;
gen_drv.get(pkt);
drv_sb.put(pkt);
i.a =pkt.a;
i.b=pkt.b;
endtask
endclass

//monitor
class monitor;
packet pkt;
mailbox #(packet)mon_sb;

virtual intf i;
function new(mailbox #(packet)mon_sb,virtual intf i);
this.mon_sb=mon_sb;
this.i=i;
endfunction
task run;
pkt=new();
pkt.a=i.a;
pkt.b=i.b;
pkt.out=i.out;
mon_sb.put(pkt);
endtask
endclass

//scoreboard
class scoreboard;
packet pkt1,pkt2;
mailbox #(packet)drv_sb; //FROM DRIVER : pkt2
mailbox #(packet)mon_sb; //FROM MONITOR : pkt1
function new(mailbox #(packet)drv_sb,mailbox #(packet)mon_sb);
this.drv_sb=drv_sb;
this.mon_sb=mon_sb;
endfunction
task run;
mon_sb.get(pkt1);
drv_sb.get(pkt2);
pkt2.out=pkt2.a*pkt2.b;
assert(pkt1.out==pkt2.out)
begin
$display(" design is ok");
$display($time,"\t SCOREBOARD: a=%d b=%d
out=%d",pkt1.a,pkt1.b,pkt1.out);
$display($time,"\t DUT: a=%d b=%d
out=%d",pkt2.a,pkt2.b,pkt2.out);
end
else
begin
$display(" design is not ok");
$display($time,"a=%d b=%d out=%d",pkt1.a,pkt1.b,pkt1.out);

end
endtask
endclass

//coverage group
class coverage;
virtual intf i;
covergroup cg @(i.a,i.b);
//A: coverpoint i.a{bins a1 = {127};bins a2 = {255};bins a3 ={7'bx};}
//B: coverpoint i.b{bins b1 = {32};bins b2 = {64};bins b3 ={255};}
//O: coverpoint i.out{bins o1 = {65025};bins o2 = {256,65512};}
A:coverpoint i.a{bins a1 = {[0:4]}; bins a2 = {[12:15]};}
B: coverpoint i.b{bins b1 = {[5:8]}; bins  b2=  {[9:11]};}
AxB : cross A,B;
endgroup
function new (virtual intf i);
this.i = i ;
cg = new;
endfunction
task sample();
cg.sample();
endtask
endclass

//environment
class environment;
mailbox #(packet)gen_drv;
mailbox #(packet)drv_sb;
mailbox #(packet)mon_sb;
virtual intf i;
generator g1;
driver d1;
coverage c1;
monitor m1;
scoreboard s1;
function new(virtual intf i);
this.i=i;
endfunction
function build;
gen_drv=new();

drv_sb=new();
mon_sb=new();
g1=new(gen_drv);
d1=new(gen_drv,drv_sb,i);
c1=new(i);
m1=new(mon_sb,i);
s1=new(drv_sb,mon_sb);
endfunction
task run;
g1.run();
d1.run();
c1.sample();
#1 m1.run();
s1.run();
endtask
endclass

//test
program env_mul8bit_test(intf i);
environment en;
initial
begin
en=new(i);
en.build();
repeat(20000)
begin
en.run();
end
end
endprogram

module env_mul8bit_top;
intf i();
mul8bit_rp aa(.a(i.a),.b(i.b),.out(i.out));
env_mul8bit_test t(i);
endmodule