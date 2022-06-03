disp('Loading seek params...');
t0 = tic();

run('load_simulation_params.m');
run('load_model_related_params.m');

toc(t0);
disp('Seek params loaded.');

