//module scope_resolution();
string name =  "sam";
module mod();
string name = "sss";
task print();
$display("you've got 1 ",$unit::name,"!");
$display ("i've got 1 ",name,"!");
$display ("i've got 2 ",$root.mod.name,"!");
endtask :print

initial 
begin
print();
end
endmodule 