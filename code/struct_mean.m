function acc = struct_mean(struct_, field)
    acc = zeros(size(struct_(1).(field)));
    n = length(struct);
    
    for i = 1:n
        acc = acc + struct_(i).(field);
    end
    
    acc = acc/n;
end