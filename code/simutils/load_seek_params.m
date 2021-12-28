disp('Loading seek params...');
t0 = tic();

noise_option = noise_options{i};
noise_devval = noise_devvals{i}; 
noise_name = noise_names{i};

run('load_parameters.m');

options = struct('');
options(1).AbsTol = '1e-3';
options(1).RelTol = '1e-3';

toc(t0);
disp('Seek params loaded.');