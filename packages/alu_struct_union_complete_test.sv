`include "alu_bit_package.sv"

module alu_struct_union_complete_test; 

import alu_bit_package ::*;

initial
begin
	 arith_data.ip_data1 = 8'd0;
 	 arith_data.ip_data2 = 8'd0;
	 logic_data.ip_data1 = 8'd0;
	 logic_data.ip_data2 = 8'd0;
	 arith_logic_sel = 1'b0;
	 arithlogic_op = 2'd0;
repeat(256)//arithmatic
begin
	repeat(256)//logic
	begin
		repeat(4)//operation
		begin
			repeat(2)//logic/arithmatic
			begin
				if(arith_logic_sel == 1'b1)
				begin
					case(arithlogic_op)
	        			2'd0: data_out = arith_data.ip_data1 + arith_data.ip_data2;
					2'd1: data_out = arith_data.ip_data1 - arith_data.ip_data2;
					2'd2: data_out = arith_data.ip_data1 * arith_data.ip_data2;
					2'd3: data_out = arith_data.ip_data1 / arith_data.ip_data2;
			     		default: data_out = 16'd0; 	
				endcase
				final_result.result.result_data = data_out;
				end
				else
				begin
					case(arithlogic_op)
	        			2'd0: data_out = ~(logic_data.ip_data1 & logic_data.ip_data2);
					2'd1: data_out = ~(logic_data.ip_data1 | logic_data.ip_data2);
					2'd2: data_out = ~ logic_data.ip_data1;
					2'd3: data_out =   logic_data.ip_data1 ^ logic_data.ip_data2;
                        		default: data_out = 16'd0; 
				endcase
				final_result.result.result_data = data_out;
				end
				$display  ("result_data=%0d arithlogic_op=%b arith_logic_sel=%b",final_result.result.result_data,arithlogic_op,arith_logic_sel);
			#10 arith_logic_sel = arith_logic_sel +1;
			end
		#10 arithlogic_op = arithlogic_op +1;
		end
	#10{logic_data.ip_data1,logic_data.ip_data2} = {logic_data.ip_data1,logic_data.ip_data2}+1;
	end
#10 {arith_data.ip_data1,arith_data.ip_data2}={arith_data.ip_data1,arith_data.ip_data2}+1;
end	
#100;	
end

endmodule
