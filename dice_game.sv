module dice_game (input clk,rst,p,output [6:0]led);
enum {g0,g1,g10,g11,g100,g101,g110} p_state,n_state;

always_ff @ (posedge clk)
begin
	if(rst)
		p_state <= g0;
	else
		p_state <= n_state;
end

always_comb
begin
	case(p_state)
		g0: if(p)
		    begin
			n_state = g1;
			led = 7'b0000000;
		    end
		    else
		    begin
			n_state = g0;
			led = 7'b0000000;
		    end
end
