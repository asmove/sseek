disp('Loading source seeking simulation...');
t0 = tic();

run('load_seek_params.m');
simOut = sim_block_diagram(ctx.model_name, options);        
toc(t0);

run('save_instance.m');
