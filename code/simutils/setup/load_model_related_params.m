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

% Source seeking parameters
source_params.nu = nu;
source_params.lambda = lambda;
source_params.T_sample = T_sample;
source_params.T_cur = T_cur;
source_params.devval = devval;

SAT_CONTROL = 10;

% Future sensor readings
R1 = sys.descrip.bodies{1}.R(1:2, 1:2);
R2 = sys.descrip.bodies{2}.R(1:2, 1:2);
R3 = sys.descrip.bodies{3}.R(1:2, 1:2);

Ps = [L/2; 0];
states = sys.descrip.states;

sensors_params.positions = {R1*Ps, R2*Ps, R3*Ps};
