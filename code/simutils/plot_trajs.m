fields = fieldnames(field_avg);
for i = 1:length(fields)
    field = fields{i};
    avg_values.(field) = field_avg.(field)/n_sims;
end

% Data readw
time_ = avg_values.tout;
time_q = time_;
coordinates = avg_values.coordinates;

time_p = time_;
p_speeds = avg_values.p_speeds;

time_qp = time_;
qp_speeds = avg_values.q_speeds;

time_traj = time_;
trajs = avg_values.trajs;

time_readings = time_;
readings = avg_values.readings;

time_estimations = time_;
estimations = avg_values.estimations;

time_xhat = time_;
xhat = avg_values.xhat;

time_xhat_interval = time_;
xhat_interval = avg_values.xhat_interval;

time_m = time_;
m_interval = avg_values.m_interval;

time_u = time_;
u = avg_values.u;

% Instances plot
xm = -5;
xM = 5;
ym = -5;
yM = 5;

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
        wb.update_waitbar(i*nx + j, nx*ny);
    end
end

wb.close_window();

[X,Y] = meshgrid(x,y);

hfig_instances = my_figure();

contour(X, Y, Z);
hold on;

for i = 1:n_sims
    coordinates_ = instances{i}.coordinates;
    xhat_interval = instances{i}.xhat_interval;
    
%     plot(coordinates_(:, 1), coordinates_(:, 2));
%     hold on;

    plot(xhat_interval(end, 1), xhat_interval(end, 2), ...
         'co', 'MarkerSize', 15, 'MarkerFaceColor', 'blue');
    hold on;

    plot(coordinates(1, 1), coordinates(1, 2), ....
         'gp', 'MarkerSize', 15, 'MarkerFaceColor', 'green');
    hold on;

    plot(coordinates(end, 1), coordinates(end, 2), ...
         'sr', 'MarkerSize', 15, 'MarkerFaceColor', 'red');
    hold on;
end
colorbar

hold off;

axis(gca, 'square');

xlabel('$x$ $[m]$', 'interpreter', 'latex');
ylabel('$y$ $[m]$', 'interpreter', 'latex');

plot_info.titles = {'', '', '', '', '', ''};
plot_info.xlabels = {'', '', '', ...
                     '$t$ $[s]$', '$t$ $[s]$', '$t$ $[s]$'};
plot_info.ylabels = {'$x$ $[m]$', '$y$ $[m]$', '$\theta$ $[rad]$', ...
                     '$\phi_1$ $[rad]$', ...
                     '$\phi_2$ $[rad]$', ...
                     '$\phi_3$ $[rad]$'};
plot_info.grid_size = [2, 3];

x = coordinates;

[h_q, axs] = my_plot(time_q, x, plot_info);

axis(axs{1}{1}, 'square');
axis(axs{1}{2}, 'square');
axis(axs{1}{3}, 'square');
axis(axs{1}{4}, 'square');
axis(axs{1}{5}, 'square');
axis(axs{1}{6}, 'square');

axs{1}{1}.YLim = [-5, 3];
axs{1}{2}.YLim = [-5, 5];
axs{1}{3}.YLim = [-4, 4];
axs{1}{4}.YLim = [-30, 30];
axs{1}{5}.YLim = [0, 400];
axs{1}{6}.YLim = [-400, 0];

% Input
plot_info.titles = {'', '', '', '', '', ''};
plot_info.xlabels = {'', '', '', '', '', ''};
plot_info.ylabels = {'$\tau_1$ $[Nm]$', ...
                     '$\tau_2$ $[Nm]$', ...
                     '$\tau_3$ $[Nm]$'};
plot_info.grid_size = [1, 3];

[h_u, axs] = my_plot(time_u, u, plot_info);

axis(axs{1}{1}, 'square');
axis(axs{1}{2}, 'square');
axis(axs{1}{3}, 'square');

max_val = 5;
axs{1}{1}.YLim = [-max_val, max_val];
axs{1}{2}.YLim = [-max_val, max_val];
axs{1}{3}.YLim = [-max_val, max_val];

plot_info.titles = {'', '', '', '', '', ''};
plot_info.xlabels = {'', '', '', ...
                     '$t$ $[s]$', '$t$ $[s]$', '$t$ $[s]$'};
plot_info.ylabels = {'$\dot{x}$ $[m]$', ...
                     '$\dot{y}$ $[m]$', ...
                     '$\dot{\theta}$ $[\frac{rad}{s}]$', ...
                     '$\dot{\phi_1}$ $[\frac{rad}{s}]$', ...
                     '$\dot{\phi_2}$ $[\frac{rad}{s}]$', ...
                     '$\dot{\phi_3}$ $[\frac{rad}{s}]$'};
plot_info.grid_size = [2, 3];

[h_qp, axs] = my_plot(time_qp, qp_speeds, plot_info);

axis(axs{1}{1}, 'square');
axis(axs{1}{2}, 'square');
axis(axs{1}{3}, 'square');
axis(axs{1}{4}, 'square');
axis(axs{1}{5}, 'square');
axis(axs{1}{6}, 'square');

axs{1}{1}.YLim = [-5, 5];
axs{1}{2}.YLim = [-5, 5];
axs{1}{3}.YLim = [-30, 40];
axs{1}{4}.YLim = [-150, 150];
axs{1}{5}.YLim = [-150, 100];
axs{1}{6}.YLim = [-100, 100];

% Speeds
plot_info.titles = {'', '', ''};
plot_info.xlabels = {'', '', '', '', '', ''};
plot_info.ylabels = {'$v_x$ $[\frac{m}{s}]$', ...
                     '$v_y$ $[\frac{m}{s}]$', ...
                     '$\dot{\theta}$ $[\frac{rad}{s}]$'};
plot_info.grid_size = [1, 3];

[h_p, axs] = my_plot(time_p, p_speeds, plot_info);

axis(axs{1}{1}, 'square');
axis(axs{1}{2}, 'square');
axis(axs{1}{3}, 'square');

% XY plot
h_xy = my_figure();

contour(X, Y, Z);
hold on;

plot(coordinates(:, 1), coordinates(:, 2), 'b-');
hold on;

plot(xhat_interval(:, 1), xhat_interval(:, 2), ...
     'k-', 'Linewidth', 3);
hold on;

plot(coordinates(1, 1), coordinates(1, 2), ....
     'gp', 'MarkerSize', 15, 'MarkerFaceColor', 'green');
hold on;

plot(coordinates(end, 1), coordinates(end, 2), ...
     'sr', 'MarkerSize', 15, 'MarkerFaceColor', 'red');

hold on;

if(~isempty(fieldnames(params)))
    plot(params.center(1), params.center(2), ....
         'co', 'MarkerSize', 15, 'MarkerFaceColor', 'blue');

    hold off;
end

axis([xm xM ym yM]);
axis(gca, 'square');

xlabel('$x$ $[m]$', 'interpreter', 'latex');
ylabel('$y$ $[m]$', 'interpreter', 'latex');

% Source value
plot_info.titles = {''};
plot_info.xlabels = {'$t$ $[s]$'};
plot_info.ylabels = {'$f(x)$'};
plot_info.grid_size = [1, 1];

[h_f, axs] = my_plot(time_readings, readings, plot_info);

axis(axs{1}{1}, 'square');
axs{1}{1}.YLim = [0, 25];

% Source estimation on interval
plot_info.titles = {'', ''};
plot_info.xlabels = {'$t$ [s]', '$t$ [s]'};
plot_info.ylabels = {'$x_{\mathcal{I}}$ $[m]$', ...
                     '$y_{\mathcal{I}}$ $[m]$'};
plot_info.grid_size = [1, 2];

[h_xhi, axs] = my_plot(time_xhat_interval, xhat_interval, plot_info);

axis(axs{1}{1}, 'square');
axis(axs{1}{2}, 'square');

% Estimation value
plot_info.titles = {'', ''};
plot_info.xlabels = {'$t$ [s]', '$t$ [s]'};
plot_info.ylabels = {'$\hat{x}$ $[m]$', '$\hat{y}$ $[m]$'};
plot_info.grid_size = [1, 2];

[h_xhat, axs] = my_plot(time_xhat, xhat, plot_info);

axis(axs{1}{1}, 'square');
axis(axs{1}{2}, 'square');

root_path = [cpath, '/../imgs/'];
rel_path = [source_opt, '/', noise_name, '/'];
imgs_path = [root_path, rel_path];
mkdir(imgs_path);

saveas(hfig_instances, [imgs_path, 'instances'], 'epsc');
saveas(h_q, [imgs_path, 'states'], 'epsc');
saveas(h_u, [imgs_path, 'input'], 'epsc');
saveas(h_xy, [imgs_path, 'cartesian'], 'epsc');
saveas(h_qp, [imgs_path, 'state_speeds'], 'epsc');
saveas(h_p, [imgs_path, 'speeds'], 'epsc');
saveas(h_f, [imgs_path, 'function'], 'epsc');
saveas(h_xhat, [imgs_path, 'estimation'], 'epsc');

close all

