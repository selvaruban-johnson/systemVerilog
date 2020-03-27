class solver ;

rand bit [3:0]a,b;
rand reg [4:0]c;

//constraint c1 {a>5;}
//constraint c2 {b<12;}
//constraint c3 {c>7;c<13;}

task disp();
	$display("a=%d b=%d c=%d",a,b,c);
endtask

endclass