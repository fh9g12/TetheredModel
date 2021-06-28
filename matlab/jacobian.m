function jac = jacobian(t,U,p)
    p.fp = U;
    p = set_aero_forces(t,U,p);
    model_modes = p.b_modes + p.t_modes + 1;
    A = [eye(model_modes),zeros(model_modes);...
        zeros(model_modes),model.get_A(U,p)];
%     if p.V == 0
%         B = [zeros(model_modes),eye(model_modes);...
%             -model.get_C(U,p),-model.get_B(U,p)];
%     else
        B = [zeros(model_modes),eye(model_modes);...
            model.get_E(U,p)-model.get_C(U,p),model.get_D(U,p)-model.get_B(U,p)];
%     end
    jac = A\B;    
end

