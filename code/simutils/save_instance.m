disp('Saving instance...');
t0 = tic();

fields = simOut.who;

% First runtime
if(isempty(fieldnames(field_avg)))
    n_f = length(fields);
    for k = 1:n_f
        field = fields{k};
        
        if(strcmp(field, 'tout') || strcmp(field, 'coordinates'))
            instance.(field) = 0;
        end
        
        if(~strcmp(field, 'xoutNew'))
            field_avg.(field) = 0;
        end
    end
end

% Others
n_f = length(fields);
for i = 1:n_f
    field = fields{i};
    
    if(strcmp(field, 'tout') || strcmp(field, 'coordinates'))
        if(strcmp(field, 'tout'))
            instance.(field) = simOut.(field);
        elseif(strcmp(field, 'coordinates'))
            instance.(field) = simOut.(field).signals.values;
        end
    end
    
    if(~strcmp(field, 'xoutNew'))
        if(strcmp(field, 'tout'))
            aux1 = simOut.(field);
        else
            aux1 = simOut.(field).signals.values;
        end
        
        aux2 = field_avg.(field);
        field_avg(1).(field) = aux2 + aux1;
        aux3 = field_avg.(field);
    end
end

instances{end+1} = instance;

dt = toc(t0);
fprintf('Instance saved in %.2fs\n', dt);