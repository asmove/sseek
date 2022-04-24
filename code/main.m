clear all
close all
bdclose all
close_all_waitbars
clc

% Load necessary libraries
run('../loadlibs.m');

% Run source seek
cpath = pwd;
run('run_seek.m');

% run('run_animation.m');
