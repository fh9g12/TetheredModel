function out = get_f(U,p)
	%GET_F Auto-generated function from moyra
	%
	%	Created at : Mon Jun 28 13:05:53 2021 
	%	Created with : moyra https://pypi.org/project/moyra/
	%
	%% extract required parameters from structure
	I_zz = p.I_zz;
	L_ot = p.L_ot;
	m = p.m;
	I_yy = p.I_yy;
	g = p.g;
	L_tc = p.L_tc;
	%% create common groups
	rep_0 = sin(U(3));
	rep_1 = rep_0.*cos(U(3));
	rep_2 = 2*rep_1.*U(2).*U(4);
	rep_3 = L_ot.*m.*rep_0;
	rep_4 = L_ot.^2.*m;
	rep_5 = rep_1.*U(2).^2;
	%% create output vector
	out = [I_yy.*rep_2 - I_zz.*rep_2 - L_tc.*rep_3.*U(4).^2 + rep_2.*rep_4;...
		 -I_yy.*rep_5 + I_zz.*rep_5 + g.*rep_3 - rep_4.*rep_5];
end