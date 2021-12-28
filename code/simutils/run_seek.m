disp('Source seeking started!');
ts = tic();

% (dest, traj, u) noise parameters
% noise_options = {[true, false, false], ...
%                  [false, true, false], ...
%                  [false, false, true]};
% noise_devvals = {[0.5, 0, 0], ...
%                  [0, 0.5, 0], ...
%                  [0, 0, 0.5]};
% noise_names = {'dest', 'traj', 'u'};

noise_options = {[true, false, false]};
noise_devvals = {[0.5, 0, 0]};
noise_names = {'dest'};

n = length(noise_options);
field_avgs = [];
n_sim = 2;

% disp('Loading simulation blocks...');
% t_b = tic();
% 
% run('load_simulink_blocks.m');
% 
% dt = toc(t_b);
% fprintf('Simulation blocks loaded in %.2fs\n', dt);

wb_sims = my_waitbar('Loading instances');
for j = 1:n_sim
    field_avg = struct();
    
    for i = 1:n
        run('simulate_source_seek.m');
    end
    
    wb_sims.update_waitbar(j, n_sim);
end

%run('plot_trajs.m');

dt = toc(ts);
fprintf('Source seeking finished in %.2fs\n', dt);
