disp('Loading source seeking simulation...');

options = struct('');
options(1).AbsTol = '1e-3';
options(1).RelTol = '1e-3';

rng('shuffle');
[simOut, dt] = sim_block_diagram(ctx.model_name, options);        


