function out = get_M(U,p)
	%GET_M Auto-generated function from moyra
	%
	%	Created at : Mon Jun 28 13:05:52 2021 
	%	Created with : moyra https://pypi.org/project/moyra/
	%
	%% extract required parameters from structure
	I_zz = p.I_zz;
	L_ot = p.L_ot;
	m = p.m;
	I_yy = p.I_yy;
	I_xx = p.I_xx;
	L_tc = p.L_tc;
	%% create common groups
	rep_0 = sin(U(3)).^2;
	rep_1 = L_ot.^2.*m;
	rep_2 = L_ot.*L_tc.*m.*cos(U(3));
	%% create output vector
	out = [I_yy.*rep_0 - I_zz.*rep_0 + I_zz + L_tc.^2.*m + rep_0.*rep_1 rep_2;...
		 rep_2 I_xx + rep_1];
end