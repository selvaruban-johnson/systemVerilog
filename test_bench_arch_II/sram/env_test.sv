module env_test(i_interface i,ri_interface ri);
env_environment en;

initial
begin
en = new(i,ri);
en.build();
repeat(1000)
begin
#10 en.run();
end
end
endmodule 