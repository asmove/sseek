function [handles] = draw_omni_robot(hfig, sys, sim)
%      1
%   |'''''|
%   |     |
%   |.....|
%  3       2

    % Required states
    q = sim.q;
    
    x = sim.q(1);
    y = sim.q(2);
    th = sim.q(3);
    beta_ = sim.q(4);
    
    L = sys.descrip.model_params(2);
    
    P = [x; y];
    
    % Points at each wheel
    h_perimeter = viscircles(P', L, 'Color', 'k');
    axis square;
    hold on;
    
    
    uv = L*[cos(th); sin(th)];
    h_orient = quiver(P(1), P(2), uv(1), uv(2));

    hold on;    
    handle_cg = plot(P(1), P(2), 'ro');
    
    h_body = {h_perimeter, h_orient, handle_cg};
    
    hold on;
    
    % Car wheels
    handles_wheels = draw_wheels(hfig, sys, sim);
    
    hold off;
    
    handles = [h_body, handles_wheels];
end

function [h_wheels] = draw_wheels(hfig, sys, sim)
    % Required parameters
    R = sys.descrip.model_params(end-1);
    
    [~, centers] = chassi_points(sys, sim);
    
    center_1 = centers(1, :)';
    center_2 = centers(2, :)';
    center_3 = centers(3, :)';
    
    % Required states
    q = sim.q;
    
    x = sim.q(1);
    y = sim.q(2);
    th = sim.q(3);
    beta_ = sim.q(4);
    
    wheel_width = 7;
    
    % Wheels separately
    wheels = [build_wheel(center_1, th+pi/2, R, wheel_width);
              build_wheel(center_2, th+pi/2 + 2*pi/3, R, wheel_width);
              build_wheel(center_3, th+pi/2 + 4*pi/3, R, wheel_width)];
    
    t0 = tic();
    
    n_wheel = length(wheels);
    
    h_wheels = [];
    for i = 1:n_wheel
        hold on;
        h_wheel = draw_wheel(hfig, wheels(i));
    
        h_wheels = [h_wheels, h_wheel];
    end
    
end

function [h_wheel] = draw_wheel(hfig, wheel)
    set(0, 'CurrentFigure', hfig);
    
    orientation = wheel.orientation;
    R = wheel.radius;
    center = wheel.center;
    width = wheel.width;
    
    A = wheel.A;
    B = wheel.B;
    
    head = [A(1); B(1)];
    tail = [A(2); B(2)];
    
    h_tire = plot(head, tail, 'k', 'LineWidth', width);
    
    hold on;
    h_tire_center = plot(center(1), center(2), 'r+');
    hold on;
    
    h_wheel = {h_tire, h_tire_center};
end
