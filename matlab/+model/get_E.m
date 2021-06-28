function out = get_E(U,p)
	%GET_E Auto-generated function from moyra
	%
	%	Created at : Mon Jun 28 13:05:53 2021 
	%	Created with : moyra https://pypi.org/project/moyra/
	%
	%% extract required parameters from structure
	F_x = p.F_x;
	M_z = p.M_z;
	M_y = p.M_y;
	L_ot = p.L_ot;
	%% create common groups
	rep_0 = cos(U(3));
	%% create output vector
	out = [0 -F_x.*L_ot.*rep_0 + M_y.*rep_0 - M_z.*sin(U(3));...
		 0 0];
end