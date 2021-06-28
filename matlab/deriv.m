function deriv = deriv(t,U,p)
    p = set_aero_forces(t,U,p);
%     if p.V == 0 
%         accels = model.get_M(U,p)\(get_Q_damping(U,p)+get_Q_ext(U,p)-model.get_f(U,p));
%     else
%         accels = model.get_M(U,p)\(get_Q_damping(U,p)+get_Q_ext(U,p)+model.get_Q(U,p)-model.get_f(U,p));
        accels = model.get_M(U,p)\(model.get_Q(U,p)-model.get_f(U,p));
%     end
    deriv = zeros(size(U));
    for i = 1:length(U)/2
        deriv((i-1)*2+1) = U(i*2);
        deriv((i-1)*2+2) = accels(i);
    end  
end


