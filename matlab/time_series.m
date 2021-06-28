p = ParametersFactory.AlbatrossOne();
X_0 = [0,deg2rad(50),deg2rad(20),0];
% [azimuth, d(azimuth)/dt, cone angle, d(cone angle)/dt]

%% run time simulation
[t,y] = ode45(@(t,x)deriv(t,x,p),[0,30],X_0);
 
%% plot out the state vector
fig = figure(2);
clf;
for i =1:4
    subplot(1,4,i)
    plot(t,y(:,i))
end
fold = rad2deg(y(:,end-1));
copygraphics(gcf)
