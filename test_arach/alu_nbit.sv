module alu_nbit #(parameter n=4)
(input bit [n-1:0]a,b,
input bit [2:0]s,
output bit [n-1:0]sum,
output bit co);
parameter ADD=3'd0,
	SUB=3'd1,
	INR=3'd2,
	DCR=3'd3,
	AND=3'd4,
	OR=3'd5,
	XOR=3'd6;
	//CMP=3'd7;
always@(a,b,s)
begin
assert (^s!== 1'bx)
else
	$error ("sel is x");
/*assert (^a!== 1'bx)
else
	$error ("a is x");
assert (^b!== 1'bx)
else
	$error ("b is x");*/
	case(s)
	ADD:{co,sum}=a+b;
	SUB:{co,sum}=a-b;
	INR:{co,sum}=a+1'b1;
	DCR:{co,sum}=b-1'b1;
	AND:{co,sum}={1'b0,a&b};
	OR:{co,sum}={1'b0,a|b};
	XOR:{co,sum}={1'b0,a^b};
	default:{co,sum}={1'b0,~a};
//	default : {co,sum}=5'bx;
	endcase
end
endmodule
