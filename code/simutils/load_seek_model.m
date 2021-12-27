disp('Loading seek agent...');
t0 = tic();

model_name = 'bary_source_seeking';
model_path = [cpath, '/simutils/', model_name];

ctx = struct('');
ctx(1).model_name = model_name;
ctx(1).model_path = model_path;

% Load seek agent model
run('~/github/quindim/examples/omnirobot/code/load_model.m');

gen_plant_scripts(sys, ctx);

toc(t0);
disp('Seek agent loaded!');

