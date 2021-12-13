disp('Loading seek agent...');
t0 = tic();

% Load seek agent model
run('~/github/quindim/examples/omnirobot/code/main.m');
gen_plant_scripts(sys, ctx.model_name);

toc(t0);
disp('Seek agent loaded!');

disp('Loading seek control...');
t0 = tic();

% Load seek agent control
run('load_seek_control.m');

toc(t0);
disp('Seek control loaded!');
