interface counter_if(input bit clk,rst);
 bit updown;
 bit load;
 bit [3:0] d;
 bit [3:0] count;
endinterface
