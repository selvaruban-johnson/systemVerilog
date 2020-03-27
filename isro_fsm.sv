module isro_fsm (input move , rst,clk, output logic [2:0]state);
/*reg [2:0] p_state,n_state;
localparam room0 = 3'b000,
	room1 = 3'b001,
	room2 = 3'b010,
	room3 = 3'b011,
	room4 = 3'b100,
	room5 = 3'b101,
	room6 = 3'b110,
	room7 = 3'b111; */
enum {room0,room1,room2,room3,room4,room5,room6,room7}p_state,n_state;
always @ (posedge clk,posedge rst)
begin
	if(rst)
		p_state <= room0;
	else
		p_state <= n_state;
end
always @ (p_state,move)
	case(p_state)
	room0 : if(move)
			n_state = room1;
		else
			n_state = room0;
	room1 : if(move)
			n_state = room4;
		else
			n_state = room2;
	room2 : if(move)
			n_state = room4;
		else
			n_state = room3;
	room3 : if(move)
			n_state = room0;
		else
			n_state = room3;
	room4 : if(move)
			n_state = room5;
		else
			n_state = room7;
	room5 : if(move)
			n_state = room6;
		else
			n_state = room3;
	room6 : if(move)
			n_state = room6;
		else
			n_state = room7;
	room7 : if(move)
			n_state = room5;
		else
			n_state = room1;
	default : n_state = room0;
	endcase 

always @ (p_state )
	state = p_state;
endmodule
