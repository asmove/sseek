% Time [s]
tspan = field_avg.tout;

scaler = 100;
tf = tspan(end);
dt = 1e-2;
t = (0:dt:tf)';

n_q = length(sys.kin.q);
n_u = length(sys.descrip.u);

RENDERIZE = false;

if(RENDERIZE)
    t = tspan;
end

wb = my_waitbar('');
sims = {};
sols = [];

n_t = length(t);

x = [simOut.coordinates.signals.values, ...
     simOut.p_speeds.signals.values];

for i = 1:n_t
    sol_i = interp1(tspan, x, t(i));
    sols = [sols; sol_i];

    sims{i} = gen_sim(sys, sol_i', zeros([n_u, 1]), n_q); 
    wb.update_waitbar(i, n_t);
end

wb.close_window();

fig_handlers = findall(0,'type','figure','tag','TMWWaitbar');
delete(fig_handlers);

scaler = 1.5;
offset = scaler*sys.descrip.model_params(2);

x_min = -offset + min(x(:, 1));
x_max = offset + max(x(:, 1));

y_min = -offset + min(x(:, 2));
y_max = offset + max(x(:, 2));

draw_robot_func = @(hfig, sys, sim) draw_omni_robot(hfig, sys, sim);

n_t = length(t);

% Start figure simulation
hfig = my_figure();
wb = my_waitbar('');

plot(sols(:, 1), sols(:, 2), '--')
hold on

handles = [];
for i = 1:n_t
    sim = sims{i};
    
    hfig.Name = [char(t(i)), ' s'];
    hold on
    handles_robot = draw_robot_func(hfig, sys, sim);
    
    axis equal;
    axis([x_min x_max y_min y_max]);
    
    handles = [handles; getframe(gcf)];
    
    pause(dt);
    n_h = length(handles_robot);
    for j = 1:n_h 
        delete(handles_robot{j});
    end
    
    wb.update_waitbar(i, n_t);
end

wb.close_window();

save_video(handles, 'omni.avi', 1/dt);

