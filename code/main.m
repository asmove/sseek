clear all
close all
bdclose all
clc

% Load necessary libraries
run('../loadlibs.m');

disp('Source seeking started!');
ts = tic();

% Run source seek
cpath = pwd;
run('run_seek.m');

dt = toc(ts);
fprintf('Source seeking finished in %.2fs\n', dt);

