disp('Loading source expression...');
t0 = tic();

% params.center = [0, 0];
% source_opt = 'parabolic';

params = struct();
source_opt = 'peaks';
[source_expr, min_coord] = choose_and_load_source(ctx.model_name, source_opt, sys, params);

toc(t0);
disp('Source expression loaded!');
