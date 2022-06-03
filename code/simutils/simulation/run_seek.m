disp('Source seeking started!');
ts = tic();

if(~load_preparation && load_run)
    error('It is not possible to run simulations without preparation!');
end

if(load_preparation)
    run([cpath, '/simutils/prepare_simulations.m']);
end

if(load_run)
    run([cpath, '/simutils/run_simulations.m']);
end

dt = toc(ts);
fprintf('Source seeking finished in %.2fs\n', dt);
