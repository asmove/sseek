disp('Loading source expression...');

model_name = 'bary_source_seeking';
model_path = [cpath, '/simutils/', model_name];

ctx = struct('');
ctx(1).model_name = model_name;
ctx(1).model_path = model_path;

params = struct();
params.center = [1, 1];
source_opt = 'peaks';

t0 = tic();

[source_expr, min_coord] = choose_and_load_source(ctx.model_name, source_opt, sys, params);

dt = toc(t0);
fprintf('Source expression loaded in %.2fs\n', dt);