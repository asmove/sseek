function result = add_comma_between_cell_elements(cell_)
    result = '{';
    for i = 1:length(cell_)-1
        result = [result, num2str(cell_{i}), ', '];
    end
    
    result = [result, , '}'];
end