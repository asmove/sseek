disp('Loading source seeking simulation...');
t0 = tic();

run('load_seek_params.m');
rng('shuffle');
simOut = sim_block_diagram(ctx.model_name, options);        
dt = toc(t0);

run('save_instance.m');
