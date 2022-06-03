% Parameters

% Bounds for x and y coordinates
xmin = -3;
xmax = 3;

ymin = -3;
ymax = 3;

dx = 0.25;
dy = 0.25;

% Barycenter method
lambda = 1;
nu = 5;
zeta = 5;
devval = 0.5;

% Trajectory planning parameters
T_sample = 0.1;
T_cur = 0.5;
T_traj = T_cur;

% Final time
dt = 1e-3;

n_T = 24.95;
tf = n_T*T_traj;

% [s]
delta_t_disp = 0.5;

