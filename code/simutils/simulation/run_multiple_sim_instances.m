initial_instance = struct_gen(...
    {'coordinates', 'xhat_interval'}, {[], []} ...
);

for j_sim = 1:n_sims
    run('load_noise_params.m');
    
    run('simulate_source_seek.m');
    
    sim_timelapse(end+1) = dt;
    
    if(multiple_initial_coordinates)
        run('save_multiple_initial_instances.m');
        initial_instances(x0_str) = initial_instance;
    else
        run('save_instance.m');   
    end
    
    idx = (i_sims-1)*m_0*n_sims + (k_sims-1)*n_sims + j_sim;
    idf = n_sims*n_scenes*m_0;
    wb.update(idx, idf);
end

