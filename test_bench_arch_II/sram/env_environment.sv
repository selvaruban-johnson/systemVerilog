class env_environment;
mailbox #(env_packet)gen_drv;
//mailbox #(env_packet)gen_drv_mod;
mailbox #(env_packet)mon_sb1;
mailbox #(env_packet)mon_sb2;
virtual i_interface i;
virtual ri_interface ri;
env_generator g1;
env_driver d1;
//env_driver1 d2;
env_monitor m1;
env_coverage c1;
env_scoreboard s1;

function new (virtual i_interface i,virtual ri_interface ri);
this.i=i;
this.ri=ri;
endfunction


function build;
gen_drv=new();
//gen_drv_mod = new();
mon_sb1=new();
mon_sb2=new();
g1=new(gen_drv);
d1=new(gen_drv,i,ri);
//d2=new(gen_drv_mod,ri);
m1=new(mon_sb1,mon_sb2,i,ri);
s1=new(mon_sb1,mon_sb2);
c1=new(i);
endfunction

task run;
fork
g1.run();
d1.run();
//d2.run();
c1.sample();
m1.run();
s1.run();
join
endtask
endclass
