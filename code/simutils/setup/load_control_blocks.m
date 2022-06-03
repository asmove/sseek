% Control function u
expr_syms = {u_expr, v_expr};
vars = {{x_sym, v_sym, refs}, {x_sym, refs}};

Outputs = {{'u'}, {'v'}};

paths = {[ctx.model_name, '/Control/Controller/control_function_u'], ...
         [ctx.model_name, '/Control/Controller/control_function_v']};
        
fun_names = {'ControlFunction_u', 'ControlFunction_v'};

script_struct.expr_syms = expr_syms;
script_struct.vars = vars;
script_struct.Outputs = Outputs;
script_struct.paths = paths;
script_struct.fun_names = fun_names;

genscripts(sys, ctx, script_struct);

