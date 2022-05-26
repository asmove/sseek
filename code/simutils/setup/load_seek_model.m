disp('Loading seek agent...');
t0 = tic();

% Load seek agent model
run('~/github/quindim/examples/omnirobot/code/load_model.m');

model_name = 'bary_source_seeking';
model_path = [cpath, '/simutils/', model_name];

ctx = struct('');
ctx(1).model_name = model_name;
ctx(1).model_path = model_path;

gen_plant_scripts(sys, ctx);

dt = toc(t0);
fprintf('Seek agent loaded in %.2fs\n', dt);

