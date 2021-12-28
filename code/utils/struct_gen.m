function struct_ = struct_gen(fields, defaults)
    n_f = length(fields);
    for i = 1:n_f
        field_i = fields{i};
        default_i = defaults{i};
        
        struct_.(field_i) = default_i;
    end
end
