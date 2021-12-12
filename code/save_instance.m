fields = simOut.who;
field_avgs = [];

% First runtime
if(isempty(fieldnames(field_avg)))
    n_f = length(fields);
    for i = 1:n_f
        field = fields{i};
        for i = 1:n_f
            field = fields{i};

            if(~strcmp(field, 'tout') && ~strcmp(field, 'xoutNew'))
                field_avg.(field) = 0;
            end
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
