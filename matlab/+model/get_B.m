function out = get_B(U,p)
	%GET_B Auto-generated function from moyra
	%
	%	Created at : Mon Jun 28 13:05:53 2021 
	%	Created with : moyra https://pypi.org/project/moyra/
	%
	%% extract required parameters from structure
	I_zz = p.I_zz;
	L_ot = p.L_ot;
	m = p.m;
	I_yy = p.I_yy;
	L_tc = p.L_tc;
	%% create common groups
	rep_0 = sin(U(3));
	rep_1 = 2*rep_0.*cos(U(3));
	rep_2 = rep_1.*U(4);
	rep_3 = L_ot.^2.*m;
	rep_4 = rep_1.*U(2);
	rep_5 = I_yy.*rep_4;
	rep_6 = I_zz.*rep_4;
	rep_7 = rep_3.*rep_4;
	%% create output vector
	out = [I_yy.*rep_2 - I_zz.*rep_2 + rep_2.*rep_3 -2*L_ot.*L_tc.*m.*rep_0.*U(4) + rep_5 - rep_6 + rep_7;...
		 -rep_5 + rep_6 - rep_7 0];
end