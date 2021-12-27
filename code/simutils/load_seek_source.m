disp('Loading source expression...');
t0 = tic();

model_name = 'bary_source_seeking';
model_path = [cpath, '/simutils/', model_name];

ctx = struct('');
ctx(1).model_name = model_name;
ctx(1).model_path = model_path;

params = struct();
params.center = [0, 0];
source_opt = 'parabolic';

% source_opt = 'peaks';

[source_expr, min_coord] = choose_and_load_source(ctx.model_name, source_opt, sys, params);

toc(t0);
disp('Source expression loaded!');
