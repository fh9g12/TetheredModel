function out = get_Q(U,p)
	%GET_Q Auto-generated function from moyra
	%
	%	Created at : Mon Jun 28 13:05:53 2021 
	%	Created with : moyra https://pypi.org/project/moyra/
	%
	%% extract required parameters from structure
	F_x = p.F_x;
	M_x = p.M_x;
	M_z = p.M_z;
	M_y = p.M_y;
	L_ot = p.L_ot;
	F_y = p.F_y;
	%% create common groups
	rep_0 = sin(U(3));
	%% create output vector
	out = [-F_x.*L_ot.*rep_0 + M_y.*rep_0 + M_z.*cos(U(3));...
		 F_y.*L_ot + M_x];
end