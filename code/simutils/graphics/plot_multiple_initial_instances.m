clear avg_values;

scale = 1.5;

% Instances plot
xm = scale*xmin;
xM = scale*xmax;
ym = scale*ymin;
yM = scale*ymax;

n = 60;
x = linspace(xm, xM, n);
y = linspace(ym, yM, n);

nx = length(x);
ny = length(y);

wb = my_waitbar('Loading function.');

Z = zeros(nx, ny);
for i = 1:nx
    xi = x(i);
    for j = 1:ny 
        yi = y(j);
        Z(i, j) = my_subs(source_expr, sys.kin.q(1:2), [xi; yi]);
        wb.update(i*nx + j, nx*ny);
    end
end

wb.close_window();

[X,Y] = meshgrid(x,y);

hfig_instances = my_figure();

contour(X, Y, Z, 'ShowText','on');
hold on;

keys = initial_instances.keys;

wb = my_waitbar('Loading instances...');

for i = 1:length(keys)
    key_ = char(keys{i});
    coordinates_ = initial_instances(key_).coordinates;
    xhat_interval = initial_instances(key_).xhat_interval;
    
    plot(xhat_interval(:, 1), ...
         xhat_interval(:, 2), ...
         'r.', ...
         'MarkerSize', 15, ...
         'MarkerFaceColor', 'blue', ...
         'DisplayName', '$\hat{x}_f$');
    hold on;
    
    plot(coordinates_(:, 1), ... 
         coordinates_(:, 2), ...
         'b.', ...
         'MarkerSize', 15, ...
         'MarkerFaceColor', 'red', ...
         'DisplayName', '$x_f$');
    
    hold on;

    wb.update(i, length(keys));
end

wb.close_window();

% hold on;
% 
% plot(xhat_interval(:, 1), xhat_interval(:, 2), ...
%      'k-', ...
%      'Linewidth', 3, ...
%      'DisplayName', '$\hat{x}(t)$');

h_leg = legend(legendUnq(hfig_instances));

set(gca,'TickLabelInterpreter','latex')

set(h_leg, 'interpreter', 'latex')

colorbar('TickLabelInterpreter', 'latex');

hold off;

axis(gca, 'square');

xlabel('$x$ $[m]$', 'interpreter', 'latex');
ylabel('$y$ $[m]$', 'interpreter', 'latex');

root_path = [cpath, '/../imgs'];
filepath = [root_path, '/multiple_initial/'];

mkdir(imgs_path);

saveas(hfig_instances, [filepath, 'multiple_initial'], 'epsc');
