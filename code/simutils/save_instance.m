disp('Saving instance...');
t0 = tic();

fields = simOut.who;

% First runtime
if(isempty(fieldnames(field_avg)))
    n_f = length(fields);
    for k = 1:n_f
        field = fields{k};
        if(~strcmp(field, 'tout') && ~strcmp(field, 'xoutNew'))
            field_avg.(field) = 0;
        end
    end
end

% Ithers
n_f = length(fields);
for i = 1:n_f
    field = fields{i};

    if(~strcmp(field, 'tout') && ~strcmp(field, 'xoutNew'))
        field_avg.(field) = field_avg.(field) + ...
                            simOut.(field).signals.values;
    end
    
    field_avgs = [field_avgs, field_avg];
end

dt = toc(t0);
fprintf('Instance saved in %.2fs\n', dt);