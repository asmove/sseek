disp('Loading simulation blocks...');
t_b = tic();

model_name = 'bary_source_seeking';
model_path = [cpath, '/simutils/simulation/diagrams/', model_name];

ctx = struct('');
ctx(1).model_name = model_name;
ctx(1).model_path = model_path;

run('load_seek_model.m');
run('load_seek_control.m');
run('load_seek_source.m');

dt = toc(t_b);
fprintf('Simulation blocks loaded in %.2fs\n', dt);

