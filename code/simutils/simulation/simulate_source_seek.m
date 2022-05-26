run('load_seek_params.m');

disp('Loading source seeking simulation...');

rng('shuffle');
[simOut, dt] = sim_block_diagram(ctx.model_name, options);        


