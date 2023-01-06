PATHS = {'sseek', 'quindim', 'matils', 'baryopt'};

GITPATH = '~/github/';

for i = 1:3
	libpath_i = [GITPATH, PATHS{i}];

	addpath(libpath_i);
	addpath(genpath(libpath_i));
	savepath;
end

