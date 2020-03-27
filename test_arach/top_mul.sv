//DUT
module mul8bit_rp
(output logic [15:0]out,
input [7:0] a,b);
logic [15:0]temp;
integer i;
always@(a,b)
begin
assert (^a!==1'bx)
else
	$fatal ("a is x");
assert (^b!==1'bx)
else
	$fatal("b is x");
out=b[0]?{1'b0,a,7'b0}:15'd0;
for(i=1;i<8;i=i+1)
begin
if(b[i])begin temp=out>>1'b1;out=temp+{1'b0,a,7'b0};end
else
begin temp=out>>1'b1;out= temp; end
end
end
endmodule


//packet
class packet;
rand bit [7:0]a,b;
bit [15:0]out;
endclass


//interface
interface mul;
bit [7:0]a,b;
bit [15:0]out;
endinterface


//generator
class generator;
packet pkt;
mailbox #(packet) gen_drv;
function new (mailbox #(packet) gen_drv);
this.gen_drv=gen_drv;
endfunction
task run();
pkt=new();
	assert(pkt.randomize())
	gen_drv.put(pkt);
	else
	$display("miss");
endtask
endclass


//driver
class driver;
packet pkt;
mailbox #(packet) gen_drv;
mailbox #(packet) drv_sb;
virtual mul i;
function new (mailbox #(packet) gen_drv,mailbox #(packet) drv_sb,virtual mul i);
this.gen_drv=gen_drv;
this.drv_sb=drv_sb;
this.i=i;
endfunction
task run();
gen_drv.get(pkt);
drv_sb.put(pkt);
i.a=pkt.a;
i.b=pkt.b;
endtask
endclass


//monitor
class monitor;
packet pkt=new();
mailbox #(packet) mon_sb;
virtual mul i;
function new (mailbox #(packet) mon_sb,virtual mul i);
this.mon_sb=mon_sb;
this.i=i;
endfunction
task run();
pkt.a=i.a;
pkt.b=i.b;
pkt.out=i.out;
mon_sb.put(pkt);
endtask
endclass


//scoreboard
class scoreboard;
packet pkt1,pkt2;
mailbox #(packet) drv_sb;
mailbox #(packet) mon_sb;
function new (mailbox #(packet) drv_sb,mailbox #(packet) mon_sb);
this.drv_sb=drv_sb;
this.mon_sb=mon_sb;
endfunction
task run();
drv_sb.get(pkt1);
mon_sb.get(pkt2);
	{pkt1.out}=pkt1.a*pkt1.b;
		assert(pkt1.out==pkt2.out)
			$display("hit");
		else
			$display("miss");
endtask
endclass





//covergroup
class coverage;
virtual mul i;
covergroup cg @ (i.a,i.b);
A:coverpoint i.a{bins a1 = {127};
ignore_bins a2 = {255};bins a3 = {7'bx};}
B:coverpoint i.b{bins b1 = {32};bins b2 = {64};
ignore_bins b3 ={255};bins b4 = {7'bx};}
OUT:coverpoint i.out{bins o1 = {65025};bins o2 = {256,65512};}
endgroup
function new(virtual mul i);
	this.i = i;
	cg = new();
endfunction
task sample();
cg.sample();
endtask
endclass


//environment
class environment;
mailbox #(packet) gen_drv;
mailbox #(packet) drv_sb;
mailbox #(packet) mon_sb;
generator g1;
driver d1;
monitor m1;
coverage c1;
scoreboard s1;
virtual mul i;
function new (virtual mul i);
this.i=i;
endfunction
function void build();
gen_drv=new();
drv_sb=new();
mon_sb=new();

g1=new(gen_drv);
d1=new(gen_drv,drv_sb,i);
m1=new(mon_sb,i);
c1=new(i);
s1=new(drv_sb,mon_sb);
endfunction
task run();
g1.run();
d1.run();
c1.sample();
#1 m1.run();
s1.run();
endtask
endclass


//test
module test(mul i);
environment en;
initial begin
en=new(i);
en.build();
repeat(200000)
en.run();
end
endmodule


//top_mul
module top_mul();
mul i();
mul8bit_rp a1(.out(i.out),.a(i.a),.b(i.b));
test t1(.i(i));
endmodule
