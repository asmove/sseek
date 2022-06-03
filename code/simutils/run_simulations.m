wb_sims = my_waitbar('Loading instances');

for i_sims = 1:n_scenes    
    
    % Select simulation scenario
    run([cpath, '/simutils/setup/load_noise_params.m']);
    
    % Select initial coordinate
    run([cpath, '/simutils/setup/load_initial_coordinate.m']);
    
    for k_sims = 1:m_0
        curr_x0 = x0_tuples(k_sims, :)';
        
        % Initial conditions
        x0 = [curr_x0; 0; 0; 0; 0; 0; 0; 0];
        
        % Initial source position estimation
        z = gaussianrnd([0; 0], devval);
        xhat0 = x0(1:2) + z;
        
        run([cpath, '/simutils/simulation/run_multiple_sim_instances.m']);
    end

    if(plot_trajs_flag)
        if(multiple_initial_coordinates)
            run('plot_multiple_initial_instances.m');
        else
            run('plot_trajs.m');
        end
    end
end

wb_sims.close_window()