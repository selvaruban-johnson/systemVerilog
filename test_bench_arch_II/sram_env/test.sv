module test (intf i);

 environment en;

 initial 
  begin
   
   en = new(i);
   en.build();

   repeat (1000)
   #10 en.run();

  end

endmodule
