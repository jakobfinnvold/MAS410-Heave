clc; clear; close all;

g = 9.81; 
z_w = 0.8; %m
T_w = 10; %s
n_sh = 3;
i_g = 46; 
m_pl = 9000; %kg
d_D = 0.45; %m
mu_eq = 0.15; 
omega_0 = 5; %rad/s



% max motor moment
omega_M = 4500*2*pi/60 % from motor catalouge
Mmax  = m_pl*g*d_D/(2*n_sh*2*i_g)*(1+mu_eq*tanh(omega_M/omega_0))

t = 0;
dt = 1e-2;
counter = 1;
while t <20
zp =z_w*sin(2*pi*t/T_w);
v = 2*pi*z_w*cos(2*pi*t/T_w)/T_w;
a = -4*pi^2*z_w*sin(2*pi*t/T_w)/ T_w^2;
counter = counter+1;
t = t+dt;
zpplot(counter)=zp;
vplot(counter)=v;
aplot(counter)=a;
tplot(counter) = t;
end
plot(tplot,zpplot)

hold on 
plot(tplot, vplot)
hold on
plot(tplot,aplot)
legend('p','v', 'a')
grid;
a_max = max(aplot)

p = 210e+5; %N/m^2
Qmax = 200*6e-4; %m^3/sek
ro = 875; %kg/m^3

% Step 6:   select motor: 
%hydraulic check: D> 2piMmax/p
Hyd_check = 2*pi*Mmax/p *1e+6 %cm^3
% choose a motor with D > 24.8cm^3
D = 28.1e-6; %m^3


% step 7:    select pump:
% max motor speed = 128 rpm (from jacobs script)
Q_max = 128*D *1e+3 % l/min
% = 3.6 l/min, very low, but might be right considering the low motorspeed
% select the smallest pump: 63l/min and 235 bar
%assume 10bar drop across the servo valve (based on lectures)
% ==> pressure at the motor inlet is 225 bar:

deltap = 215e+5; % N/m2 pressure drop across the motor
Mm = D*deltap/(2*pi)
% this gives a moment of 96.2 N/m with the selected pump. 

