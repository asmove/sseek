% Parameters

% Barycenter method
lambda = 1;
nu = 5;
zeta = 5;
devval = 0.5;

% Initial conditions
x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0];

% Initial source position estimation
z = gaussianrnd([0; 0], devval);
xhat0 = x0(1:2) + z;

% Trajectory planning parameters
T_sample = 0.1;
T_cur = 0.5;
T_traj = T_cur;

% Final time
dt = 1e-3;

n_T = 40;
tf = n_T*T_traj;

% [s]
delta_t_disp = 0.5;

% Saturation parameters
L = sys.descrip.model_params(2);

v0 = 5;
perc = 0.25;
v_min = (1 - perc)*v0;
v_max = (1 + perc)*v0;
w_max = v0/L;

sat_params.v_min = v_min;
sat_params.v_max = v_max;
sat_params.w_max = w_max;
sat_params.u_sat = 10;

% Source seeking parameters
source_params.nu = nu;
source_params.lambda = lambda;
source_params.T_sample = T_sample;
source_params.T_cur = T_cur;
source_params.devval = devval;

% Trajectory parameters
trajectory_info = struct('T_traj', T_traj, 'dt', dt);
trajectory_info.deltas = out.deltas;
trajectory_info.thetaA = 0;
trajectory_info.alphaA = 0.5;
trajectory_info.alphaB = 0.5;
trajectory_info.deltas = out.deltas;

trajectory_info.devval_P0 = 0.5;
trajectory_info.devval_traj = 0.5;
trajectory_info.is_dest_noised = true;
trajectory_info.is_traj_noised = false;

% Control parameters
control_info.devval = 0.5;
control_info.is_control_noised = false;

SAT_CONTROL = 10;

% Future sensor readings
L_2 = sys.descrip.model_params(2)/2;

R1 = sys.descrip.bodies{1}.R(1:2, 1:2);
R2 = sys.descrip.bodies{2}.R(1:2, 1:2);
R3 = sys.descrip.bodies{3}.R(1:2, 1:2);

Ps = [L_2; 0];
states = sys.descrip.states;

sensors_params.positions = {R1*Ps, R2*Ps, R3*Ps};
