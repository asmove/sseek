run([cpath, '/simutils/setup/load_initialization.m']);
run([cpath, '/simutils/setup/load_simulation_params.m']);

% Average simulation time
t_s_mean = 15.0351;
t_end = t_s_mean*((xmax - xmin)/dx)*((ymax - ymin)/dy)*n_sims;

if(load_blocks)
    run([cpath, '/simutils/setup/load_simulink_blocks.m']);
end

run([cpath, '/simutils/setup/load_model_related_params.m']);
