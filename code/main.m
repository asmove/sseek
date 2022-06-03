clear all
close all
bdclose all
close_all_waitbars
clc

cpath = pwd;

% Load necessary libraries
run('../loadlibs.m');

load_preparation = true;
load_run = false;

% Run source seek
run('run_seek.m');

% run('run_animation.m');
