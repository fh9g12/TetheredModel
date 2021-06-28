classdef ParametersFactory    
    methods(Static)
        function p = AlbatrossOne()
            p = model.Parameters();
            p.L_ot = 22;
            p.L_tc = 0;
            p.m = 20;
            p.I_xx = 0;
            p.I_yy = 0;
            p.I_zz = 0;
            p.g = 9.81;
        end
    end
end

