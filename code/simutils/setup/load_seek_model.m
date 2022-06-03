disp('Loading seek agent...');
t0 = tic();

% Load seek agent model
run('~/github/quindim/examples/omnirobot/code/load_model.m');

gen_plant_scripts(sys, ctx);

dt = toc(t0);
fprintf('Seek agent loaded in %.2fs\n', dt);

