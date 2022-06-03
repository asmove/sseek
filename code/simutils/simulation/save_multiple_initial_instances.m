disp('Saving instance...');
t0 = tic();

fields = simOut.who;
x0_str = vec2str(curr_x0);

% First runtime
n_f = length(fields);
for k = 1:n_f
    field = fields{k};
    
    if(strcmp(field, 'coordinates') || ...
       strcmp(field, 'xhat_interval'))
        initial_instance(1).(field) = [ ...
            initial_instance(1).(field); ...
            simOut.(field).signals.values(end, 1:2) ...
        ];
    end
end

dt = toc(t0);
fprintf('Instance saved in %.2fs\n', dt);
