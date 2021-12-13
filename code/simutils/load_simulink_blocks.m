model_name = 'bary_source_seeking';

ctx = struct('');
ctx(1).model_name = model_name;

run('load_seek_agent.m');
run('load_seek_source.m');