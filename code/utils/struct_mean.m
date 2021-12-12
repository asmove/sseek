function acc = struct_mean(struct_, field)
    
    size_struct = size(struct_(1).(field));
    acc = zeros(size_struct );
    n = length(struct);
    
    for i = 1:n
        acc = acc + struct_(i).(field);
    end
    
    acc = acc/n;
end