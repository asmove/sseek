disp('Loading source expression...');

params = struct();
params.center = [1, 1];
source_opt = 'peaks';

t0 = tic();

[source_expr, min_coord] = choose_and_load_source(ctx.model_name, source_opt, sys, params);

dt = toc(t0);
fprintf('Source expression loaded in %.2fs\n', dt);
