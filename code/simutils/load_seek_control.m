disp('Loading seek control...');
t0 = tic();

% Load seek agent control
run('load_control_symbs.m')
run('load_control_blocks.m')

dt = toc(t0);
fprintf('Seek control loaded in %.2fs\n', dt);

