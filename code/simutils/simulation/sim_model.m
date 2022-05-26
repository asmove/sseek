w% Load
tf = 20;
dt = trajectory_info.dt;
time = 0:dt:tf;

model_name = 'bary_source_seeking';
simOut = sim(model_name);
