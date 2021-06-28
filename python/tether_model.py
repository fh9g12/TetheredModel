#!./env/bin/python

import moyra as ma
import moyra.elements as ele
import moyra.forces as ef
import sympy as sym
import sympy.physics.mechanics as me
import warnings
import numpy as np
import pathlib
cwd = pathlib.Path(__file__).parent.resolve()


## ------------ create symbols ------------ 
DoFs = 2          # total degrees of freedom
main_panels = 10  # main wing panels
htp_panels = 4    # horizontal tailplane panels

p = ma.DynamicModelParameters(DoFs)
p.L_ot = ma.ModelSymbol(string = 'L_ot')
p.L_tc = ma.ModelSymbol(string = 'L_tc')
p.L_tw = ma.ModelSymbol(string = 'L_tw')
p.L_te = ma.ModelSymbol(string = 'L_te')

p.m = ma.ModelSymbol(string = 'm')
p.I_xx = ma.ModelSymbol(string = 'I_xx')
p.I_yy = ma.ModelSymbol(string = 'I_yy')
p.I_zz = ma.ModelSymbol(string = 'I_zz')

p.y_i = sym.Symbol('y_i') # spanwise location

## Body Forces
p.F_x = ma.ModelSymbol(string='F_x')
p.F_y = ma.ModelSymbol(string='F_y')
p.F_z = ma.ModelSymbol(string='F_z')
p.M_x = ma.ModelSymbol(string='M_x')
p.M_y = ma.ModelSymbol(string='M_y')
p.M_z = ma.ModelSymbol(string='M_z')

# Attitude Parmas
p.g  = ma.ModelSymbol(value = 9.81,string = 'g')  # gravity


## ------------ create coordinate systems ------------ 
tether_frame = ma.HomogenousTransform().R_z(p.q[0]).R_x(p.q[1]).Translate(0,0,-p.L_ot)

#Generate Mass Matrices
M = ele.MassMatrix(p.m, I_xx = p.I_xx, I_yy=p.I_yy, I_zz=p.I_zz)

# Generate Rigid Elements
aircraft_mass = ele.RigidElement(tether_frame.Translate(p.L_tc,0,0),M,gravityPotential=True)

# Aircraft Body Forces
aircraft_forces = ef.BodyForce(p,tether_frame,p.F_x,p.F_y,p.F_z,p.M_x,p.M_y,p.M_z)


## ------------ create model and export to matlab ------------ 
sm = ma.SymbolicModel.FromElementsAndForces(p,[aircraft_mass],ExtForces=aircraft_forces)
sm.to_matlab_file(p,str(cwd.parent/'matlab'/'+matlab')+'/')
sm.to_matlab_file_linear(p,str(cwd.parent/'matlab'/'+matlab')+'/')