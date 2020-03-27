/*2. Create a class called MemTrans that contains the following members, then construct
a MemTrans object in an initial block.
a. An 8-bit data_in of logic type
b. A 4-bit address of logic type
c. A function called print that prints out the value of data_in and address*/

class MemTrans ;
randc logic [7:0] data_in;
logic [3:0] address;
function void print(input data_in,input address);
begin
	$display("data = %b address = %b",data_in,address);
end
endfunction 

endclass 

module top_class_d11_2 ();

initial
begin
	MemTrans m1 =new();
	for(int i=0;i<5;i++)
	begin
	if(m1.randomize(data_in))
	begin
		m1.address=i;
		m1.print(m1.data_in,m1.address);
	end
	else
		$display("randomize failed");
	end
end
endmodule 