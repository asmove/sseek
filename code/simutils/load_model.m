repo_path = [pwd, '/../../matlab-utils'];
path = '/control/synthesis/exact_lin/examples/omni/code/main';
run([repo_path path]);

clearvars -except sys
clear_inner_close_all(pwd);

