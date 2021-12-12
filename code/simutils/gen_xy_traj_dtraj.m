function dtrajs_ordered = gen_xy_traj_dtraj(traj_type, t, T, P0, P1, deltas, options)
    
    [traj, options] = trajgen(traj_type, t, T, P0, P1, options);
    
    trajs_cell = {};
    for delta = deltas
        trajs_cell{end+1} = zeros(delta+1, 1);
    end
    
    trajs_cell{1}(1) = traj(1);
    trajs_cell{2}(1) = traj(2);
    
    for i = 1:2
        n_id = deltas(i);
        
        trajs_aux = trajs_cell{i};
        for j = 1:n_id
            dtraj = dtrajgen(j, traj_type, t, T, P0, P1, options);        
            trajs_cell{i}(j+1) = dtraj(i);
        end
    end
    
    dtrajs_ordered = [];
    for i = 1:2
        dtrajs_ordered = [dtrajs_ordered; trajs_cell{i}];
    end
end