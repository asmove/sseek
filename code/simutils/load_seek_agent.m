disp('Loading seek agent...');
t0 = tic();

gen_plant_scripts(sys, model_name);
run('load_control.m');

toc(t0);
disp('Seek agent loaded!');
