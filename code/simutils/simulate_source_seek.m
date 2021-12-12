disp('Loading source seeking simulation...');
t0 = tic();

run('load_seek_params.m');
simOut = sim_block_diagram(model_name, x0, options);        


% disp('Loading simulation plots...');
% t0 = tic();
% 
% run('./plot_simulation.m');
% 
% toc(t0);
% disp('Simulation plots loaded.');
