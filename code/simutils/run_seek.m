% (dest, traj, u) noise parameters
noise_options = {[false, false, true]};
noise_devvals = {0.5};
noise_names = {'u'};

model_name = 'bary_source_seeking';

n = length(noise_options);
n_sim = 1;
field_avgs = [];

wb_sims = my_waitbar('Loading instances');

run('load_seek_agent.m');
run('load_seek_source.m');

for j = 1:n_sim
    field_avg = struct();
    
    for i = 1:n
        run('simulate_source_seek.m');
    end
    
    wb_sims.update_waitbar(j, n_sim);
end

run('plot_trajs.m');
