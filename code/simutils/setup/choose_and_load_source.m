function [source_expr, min_coord] = choose_and_load_source(model_name, source_opt, sys, params)
% Source: https://en.wikipedia.org/wiki/Test_functions_for_optimization
    x = sys.kin.q(1);
    y = sys.kin.q(2);
    
    methods = {'parabolic', 'rosenbrock', 'beale', 'goldstein', 'Himmelblau', 'mccormick', 'levi', 'peaks'};
    
    switch source_opt
        case 'parabolic'
            if(isfield(params, 'center'))
                c0 = params.center;
            else
                error('Parabolic optimization function must have a center.');
            end
            
            source_expr = (x- c0(1))^2 + (y - c0(2))^2;
            min_coord = params.center;
            
        case 'rosenbrock'
            source_expr = 100*(y- x)^2 + (1 - x)^2;
            min_coord = [1; 1];
            
        case 'beale'
            source_expr = (1.5-x+x*y)^2 + (2.25 - x + x*y^2)^2 + 2.625;
            min_coord = [3; 1/2];
            
        case 'goldstein'
            aux1= 1 + (x+y+1)^2*(19-14*x+3*x^2-14*y+6*x*y+3*y^2);
            aux2 = 30+(2*x-3*y)^2*(18 - 32*x + 12*x^2 + 48*y - 36*x*y+27*y^2);
            source_expr = aux1*aux2;
            min_coord = [0; -1];
            
        case 'himmelblau'
            source_expr = (x^2 + y - 11)+(x+y^2+7);
            min_coord = [3; 2];
            
        case 'mccormick'
            source_expr = sin(x+y) + (x-y)^2 - 1.5*x + 2.5*y + 1;
            min_coord = [-0.547; -1.547];
            
        case 'levi'
            expr_1 = sin(2*pi*x)^2;
            expr_2 = (x-1)^2*(1-sin(3*pi*y)^2);
            expr_3 = (y-1)^2*(1+sin(2*pi*y)^2);
            source_expr = expr_1 + expr_2 + expr_3;
            min_coord = [1; 1];
        
        case 'peaks'
            source_expr = 3*(1-x).^2.*exp(-(x.^2) - (y+1).^2) ... 
                           - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ... 
                           - 1/3*exp(-(x+1).^2 - y.^2);
            min_coord = [0; 0];
        
        otherwise
            disp(methods)
            error(['Function ', source_opt, ' not defined. choose between above ^']);
    
    end
    
    paths_i = [model_name, '/Source signal'];
    fun_name = 'source_signal';
    expr_sym = source_expr;
    vars_i = {sys.kin.q};
    output = {'f_val'};

    load_system(model_name);
    load_simblock(model_name, paths_i, fun_name, expr_sym, vars_i, output);
    save_system(model_name);
    close_system(model_name);
end