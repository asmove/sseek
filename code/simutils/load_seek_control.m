disp('Loading seek control...');
t0 = tic();

% Load seek agent control
run('load_control_symbs.m')
run('load_control_blocks.m')

toc(t0);
disp('Seek control loaded!');

