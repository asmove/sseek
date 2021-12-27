[tmp pid] = system('pgrep MATLAB');
[tmp mem_usage] = system(['cat /proc/' strtrim(pid) '/status | grep VmSize']);

mem = round(str2double(strtrim(extractAfter(extractBefore(mem_usage, ' kB'), ':')))/1024);

fprintf("Available memory: %i MB\n", mem);

