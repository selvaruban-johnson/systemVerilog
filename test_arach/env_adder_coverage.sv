class coverage ;
virtual intf i;
covergroup cg @ (i.a,i.b,i.s);
//A: coverpoint i.a{bins a1 = {3'bxxx};}
A: coverpoint i.a;
//B: coverpoint i.b{bins b1 = {3'bxxx};}
B: coverpoint i.b;
S: coverpoint i.s{bins s2 = {3'bxxx};}
//S: coverpoint i.s;
sum: coverpoint i.sum{bins s1={[0:8]};}
co: coverpoint i.co;
endgroup
function new (virtual intf i);
this.i = i ;
cg = new;
endfunction
task sample();
cg.sample();
endtask
endclass