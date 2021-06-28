function out = get_C(U,p)
	%GET_C Auto-generated function from moyra
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
	rep_0 = sin(U(3)).^2;
	rep_1 = 2*U(2).*U(4);
	rep_2 = rep_0.*rep_1;
	rep_3 = cos(U(3));
	rep_4 = rep_3.^2;
	rep_5 = rep_1.*rep_4;
	rep_6 = L_ot.*m.*rep_3;
	rep_7 = L_ot.^2.*m;
	rep_8 = U(2).^2;
	rep_9 = rep_0.*rep_8;
	rep_10 = rep_4.*rep_8;
	%% create output vector
	out = [0 -I_yy.*rep_2 + I_yy.*rep_5 + I_zz.*rep_2 - I_zz.*rep_5 - L_tc.*rep_6.*U(4).^2 - rep_2.*rep_7 + rep_5.*rep_7;...
		 0 -I_yy.*rep_10 + I_yy.*rep_9 + I_zz.*rep_10 - I_zz.*rep_9 + g.*rep_6 - rep_10.*rep_7 + rep_7.*rep_9];
end