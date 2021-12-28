function progress_block(t, tf, delta_t_disp)
    global t_i;
    persistent has_msg nbytes;

    coder.extrinsic('sprintf')

    % Initializes variable is_msg
    if(isempty(has_msg))
        has_msg = false;
    end

    if(isempty(nbytes))
        nbytes = 1;
    end

    if(t - t_i >= delta_t_disp)
        % Erase message
        if(has_msg)
            bksp_msg = repmat('\b', 1, nbytes+1);
        else
            bksp_msg = '';
    end

    msg = sprintf('(%.2f, %.2f, %3.2f)', tf, t, 100*t/tf);
    msg_ = [bksp_msg, msg];

    msg__ = sprintf(msg_);
    nbytes = length(msg);

    disp(msg__);

    has_msg = true;
    t_i = t;
end