module fa (input a,b,cin,output sum,cout);
assign sum=(a==b)?cin:~cin;
assign cout=(a==b)?a:cin;
endmodule

module using_for_gen(input [3:0]a,b,input cin,output [3:0]sum,output cout);
wire [4:0]c;
assign c[0]=cin;
genvar i;
generate
for(i=0;i<=3;i=i+1)
begin
assert (^a!==1'bx)
else
	$fatal("a is x");
assert(^b !== 1'bx)
else
	$fatal("b is x");
assert(^c!==1'bx)
else
	$fatal("cin is x");
	fa v(.sum(sum[i]),.a(a[i]),.b(b[i]),.cin(c[i]),.cout(c[i+1]));
end
endgenerate
assign cout=c[4];
endmodule


class packet;
rand bit [3:0]a,b;
rand bit cin;
bit [3:0]sum;
bit cout;
endclass

interface intf;
bit [3:0]a,b,sum;
bit cin,cout;
endinterface 

class generator;
packet pkt =new();
//pkt = new();
mailbox #(packet)gen_drv;
function new(mailbox #(packet)gen_drv);
	this.gen_drv = gen_drv;
endfunction
task run();
	//pkt = new();
	assert(pkt.randomize())
		gen_drv.put(pkt);
	else
		$display("randomizeation failed");
endtask
endclass

class driver;
packet pkt;
mailbox #(packet)gen_drv;
mailbox #(packet)drv_sb;
virtual intf i;
function new(mailbox #(packet)gen_drv,mailbox #(packet)drv_sb,virtual intf i);
	this.gen_drv =gen_drv;
	this.drv_sb = drv_sb;
	this.i=i;
endfunction
task run();
	gen_drv.get(pkt);
	drv_sb.put(pkt);
	i.a=pkt.a;
	i.b=pkt.b;
	i.cin=pkt.cin;
endtask
endclass

class monitor;
packet pkt = new();
mailbox #(packet)mon_sb;
virtual intf i;
function new(mailbox #(packet)mon_sb,virtual intf i);
	this.mon_sb = mon_sb;
	this.i = i;
endfunction
task run;
	pkt.a = i.a;
	pkt.b = i.b;
	pkt.cin=i.cin;
	pkt.sum = i.sum;
	pkt.cout = i.cout;
	mon_sb.put(pkt);
endtask
endclass

class coverage;
virtual intf i;
covergroup cg @ (i.a,i.b,i.cin);
A: coverpoint i.a {ignore_bins a1 = {4'bxxxx};bins a2 = {[4'b0000:4'b0111]};}
B: coverpoint i.b {bins b1 = {[8:15]}; ignore_bins b2 = {3'bxxx};}
Cin : coverpoint i.cin {bins c1 = {1'bx};bins c2 = {[0:1]};}
cout : coverpoint i.cout {illegal_bins co1 = {1'bx};}
sum : coverpoint i.sum {illegal_bins sum_1 = {4'bx};bins sum_2 = {[4'd10:4'd15]};}
endgroup

function new (virtual intf i);
	this.i = i;
	cg = new();
endfunction

task sample();
cg.sample();
endtask
endclass
	

class scoreboard;
packet pkt1,pkt2;
mailbox #(packet)drv_sb;
mailbox #(packet)mon_sb;
function new(mailbox #(packet)drv_sb,mailbox  #(packet)mon_sb);
	this.drv_sb = drv_sb;
	this.mon_sb = mon_sb;
endfunction
task run();
	drv_sb.get(pkt1);
	mon_sb.get(pkt2);
	{pkt1.cout,pkt1.sum}=pkt1.a+pkt1.b+pkt1.cin;
	assert(pkt1.sum==pkt2.sum && pkt1.cout==pkt2.cout)
		$display("hit a=%d b=%d cin=%d sum=%d cout=%d",pkt1.a,pkt1.b,pkt1.cin,pkt2.sum,pkt2.cout);
	else
		$display("miss");
endtask
endclass

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
function void build();
	gen_drv =new();
	drv_sb =new();
	mon_sb=new();
	g1 = new(gen_drv);
	d1 = new(gen_drv,drv_sb,i);
	m1=new (mon_sb,i);
	c1= new(i);
	s1 = new(drv_sb,mon_sb);
endfunction
task run();
	g1.run();
	d1.run();
	c1.sample();
	#1 m1.run();
	s1.run();
endtask
endclass

module test(intf i);
environment en;
initial
begin
	en =new(i);
	en.build();
	repeat(100)
		en.run();
end
endmodule 

module top_test_ripple_carry();
intf i();
using_for_gen u1 (.a(i.a),.b(i.b),.cin(i.cin),.sum(i.sum),.cout(i.cout));
test t1 (i);
endmodule 