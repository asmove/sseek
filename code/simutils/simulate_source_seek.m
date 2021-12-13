disp('Loading source seeking simulation...');
t0 = tic();

run('load_seek_params.m');
clear ctx.model_name;
simOut = sim_block_diagram(ctx.model_name, x0, options);        
toc(t0);

% disp('Loading simulation plots...');
% t0 = tic();
% 
% run('./plot_simulation.m');
% 
% toc(t0);
% disp('Simulation plots loaded.');
