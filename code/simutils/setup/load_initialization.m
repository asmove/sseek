% noise_options = {[false, false, false], ...
%                  [false, false, true]};
% noise_devvals = {[0.5, 0, 0], ...
%                  [0, 0, 0.5]};
% noise_names = {'dest', 'u'};

% noise_options = {[true, false, false], ...
%                  [false, true, false], ...
%                  [false, false, true], ...
%                  [false, false, false]};
% noise_devvals = {[0.1, 0, 0], ...
%                  [0, 0.1, 0], ...
%                  [0.5, 0, 0.5], ...
%                  [0, 0, 0]};
% 
% noise_names = {'dest', 'traj', 'u', 'none'};

noise_options = {[false, false, false]};
noise_devvals = {[0, 0, 0]};

noise_names = {'multiple'};

clear field_avg;
field_avg = struct('');

instances = {};

n_scenes = length(noise_options);

n_sims = 10;

initial_instances = containers.Map('UniformValues',false);

sim_timelapse = zeros(n_sims, 1);

% Flag for block loading, multiple initial coordinates and allow plots
load_blocks = true;
multiple_initial_coordinates = true;
plot_trajs_flag = true;
