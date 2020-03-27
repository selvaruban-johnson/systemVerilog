module random_seed;
integer num,seed,i,j;
initial
begin
for(j=0;j<4;j++)
begin
seed = j;
$display("seed is %d",seed);
for(i=0;i<10;i++)
begin
num = {$random(seed)}%10;
//num = {$random(j)}%10; //Same
$write("|num=%2d|",num); 
end 
$display(""); 
end 
end 
endmodule 
