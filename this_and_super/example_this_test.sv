class example_this;
bit [31:0]addr=32'hab;
bit[31:0]data=32'hffff;
bit write=0;
string pkt_type="inside_class";

function new (bit[31:0]addr,data,bit write, string pkt_type);
this.addr=addr;
this.data=data;
this.write=write;
this.pkt_type=pkt_type;
endfunction
function display();
$display("%d%d %b %s",addr,data,write,pkt_type);
endfunction
endclass

module example_this_test;
initial
begin
example_this d1;
//d1=new();
d1=new(20,35,1,"good_pkt");
d1.display();
end
endmodule

