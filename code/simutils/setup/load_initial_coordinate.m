if(multiple_initial_coordinates)
    [P, Q] = meshgrid(xmin:dx:xmax, ymin:dy:ymax);
    x0_tuples = [P(:), Q(:)];
else
    x0_tuples = [0, 0];
end

[m_0, ~] = size(x0_tuples);