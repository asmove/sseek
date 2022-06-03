noise_option = noise_options{i_sims};
noise_devval = noise_devvals{i_sims}; 
noise_name = noise_names{i_sims};

% Trajectory parameters
trajectory_info = struct('T_traj', T_traj, 'dt', dt);
trajectory_info.deltas = out.deltas;
trajectory_info.thetaA = 0;
trajectory_info.alphaA = 0.5;
trajectory_info.alphaB = 0.5;
trajectory_info.deltas = out.deltas;

trajectory_info.devval_P0 = noise_devval(1);
trajectory_info.devval_traj = noise_devval(2);
trajectory_info.is_dest_noised = noise_option(1);
trajectory_info.is_traj_noised = noise_option(2);

% Control parameters
control_info.devval = noise_devval(3);
control_info.is_control_noised = noise_option(3);
