function [] = generate_trajectory_column(n_d, traj_type_, t, T, P0, P1, trajectory_info)
    traj = trajgen(traj_type_, t, T, P0, P1, trajectory_info);
    dtraj = dtrajgen(n_d, traj_type, t, T, P0, P1, trajectory_info);    
    
    dx = dtraj(1);
    dy = dtraj(2);
    
    theta = atan2(dy, dx);
    
    n_xy = length(xy_t);
    
    dtraj_i1 = xy_t;
    trajs_cell = {};
    
    for i = 1:n_xy
        trajs_cell{end+1} = xy_t(i);
    end
    
    dtrajs = sym([]);
    for i = 1:n_d
        dtraj_i = diff(dtraj_i1, t_);
        dtrajs = [dtrajs; dtraj_i];
        dtraj_i1 = dtraj_i;
        
        for j = 1:n_xy
            trajs_cell_j = trajs_cell{j}; 
            trajs_cell_j = [trajs_cell_j; dtraj_i(j)] ;
            trajs_cell{j} = trajs_cell_j;
        end
    end
    
    trajs_dtrajs = [trajs_dtrajs; dtrajs];
    
    dtrajs_ordered = [];
    for i = 1:n_xy
        dtrajs_ordered = [dtrajs_ordered; trajs_cell{i}];
    end
    
end