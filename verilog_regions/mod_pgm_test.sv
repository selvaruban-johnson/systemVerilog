program bench(input clk);
initial
forever
begin
@(posedge clk)
mod_pgm_test.di.siga <= mod_pgm_test.di.sigb;
end
endprogram
//Testbench
module mod_pgm_test;
bit clk;
duv di(clk);
bench bi(clk);
initial
begin
for(int i=0;i<=16;i++)
#1 clk=~clk;
end
always@(negedge clk)
$strobe("%d\tsiga =%b\tsigb=%b\t",$time,di.siga,di.sigb);
endmodule