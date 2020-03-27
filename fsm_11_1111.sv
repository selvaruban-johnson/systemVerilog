module fsm_11_1111 (input clk,rst,x,output logic y);
enum {g0,g1,g11,g110,g111,g1111,g11110} p_state,n_state;
always_ff @ (posedge clk)
begin
	if(rst)
		p_state <=g0;
	else
		p_state <= n_state;
end

always_comb 
begin
	case(p_state)
	g0:if(x)
	   begin
		n_state <= g1;
		y=1'b0;
	   end
	   else
	   begin
		n_state <= g0;
		y=1'b0;
	   end
	g1:if(x)
	   begin
		n_state <= g11;
		y=1'b0;
	   end
	   else
	   begin
		n_state <= g0;
		y=1'b0;
	   end
	g11:if(x)
	   begin
		n_state <= g111;
		y=1'b0;
	   end
	   else
	   begin
		n_state <= g110;
		y=1'b1;
	   end
	g110:if(x)
	   begin
		n_state <= g1;
		y=1'b0;
	   end
	   else
	   begin
		n_state <= g0;
		y=1'b0;
	   end
	g111:if(x)
	   begin
		n_state <= g1111;
		y=1'b0;
	   end
	   else
	   begin
		n_state <= g0;
		y=1'b0;
	   end
	g1111:if(x)
	   begin
		n_state <= g1;
		y=1'b0;
	   end
	   else
	   begin
		n_state <= g11110;
		y=1'b1;
	   end
	g11110:if(x)
	   begin
		n_state <= g1;
		y=1'b0;
	   end
	   else
	   begin
		n_state <= g0;
		y=1'b0;
	   end
	endcase
end
endmodule 