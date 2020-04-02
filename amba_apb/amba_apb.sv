module amba_apb(input clk,rst,ready,trans,output sel,enable);

enum {idle,setup,access}p_state,n_state;

always_ff @(posedge clk);
begin
	if(rst)
		p_state  <= idle;
	else
		p_state <= n_state;

end 

always_comb
begin
	case(p_state)
	
	idle : if(trans)
		begin
			if(!trans)
			begin
    			n_state = setup;
			sel = 1'b1;
			enable = 1'b0;
			end
			else
			begin
			n_state = idle;
			sel = 1'b0;
			enable = 1'b0;
			end
		end
		else
		begin
			n_state <= idle;
			sel = 1'b0;
			enable = 1'b0;
		end
	setup : if(trans)
		begin
			n_state = access;
			sel = 1'b1;
			enable = 1'b1;
		end
		else
		begin
			n_state = setup;
			sel = 1'b1;
			enable = 1'b0;
		end
	access : if(ready)
		begin
			n_state = setup;
			sel=1'b1;
			enable = 1'b0;
			
		end
		else
		begin
			n_state = access;
			sel = 1'b1;
			enable = 1'b1;
		end
	endcase
end
endmodule 