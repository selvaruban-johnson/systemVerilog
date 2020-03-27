class coverage;

virtual intf i;

covergroup cg @(i.a,i.b);
A:coverpoint i.a;
B:coverpoint i.b;
PRO:coverpoint i.pro{bins pro1={[0:65535]};}
AxB: cross i.a,i.b;
endgroup

function new(virtual intf i);
this.i=i;
cg=new();
endfunction

task sample();
cg.sample();
endtask
endclass 