disp('Saving instance...');
t0 = tic();

instance = struct('');

fields = simOut.who;

% First runtime
if(isempty(fieldnames(field_avg)))
    n_f = length(fields);
    for k = 1:n_f
        field = fields{k};
        
        if(strcmp(field, 'tout') || ...
           strcmp(field, 'coordinates') || ...
           strcmp(field, 'xhat_interval'))
            instance(1).(field) = 0;
        end
        
    end
end

% Others
n_f = length(fields);
for i = 1:n_f
    field = fields{i};

    if(strcmp(field, 'tout') || ...
       strcmp(field, 'coordinates') || ...
       strcmp(field, 'xhat_interval'))
        if(strcmp(field, 'tout'))
            instance.(field) = simOut.(field);
        else
            instance.(field) = simOut.(field).signals.values;
        end
    end
end

instances{end+1} = instance;

dt = toc(t0);
fprintf('Instance saved in %.2fs\n', dt);