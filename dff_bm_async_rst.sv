
module dff_bm_async_rst (input logic clk,d,rst,output logic q );
	always_ff @(posedge clk,posege rst)
	begin
		if(!rst)
			q<=1'b0;
		else
			q<=d;
	end	
endmodule 
