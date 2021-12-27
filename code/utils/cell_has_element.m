function [has_elements, ...
          fields_str] = cell_has_element(cell_, fields)
    has_elements = false(length(fields), 1);
    
    n_f = length(fields);
    
    defaults = {};
    for i = 1:n_f
        defaults{end+1} = [];
    end
    fields_str = struct_gen(fields, defaults);
    
    for i = 1:length(fields)
        field = fields{i};
        
        for j = 1:length(cell_)
            cell_j = cell_{j};
            
            if(isequal(field, cell_j))
                idxs = fields_str.(field);
                
                idxs(end+1) = j;
                
                fields_str.(field) = idxs;
                has_elements(i) = true;
            end
        end
    end
end