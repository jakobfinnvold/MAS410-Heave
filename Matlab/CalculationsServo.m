clear; close all; clc; 

pr = 70e5; % Pascal
VL1 = 1e-3; % m^3
VL2 = VL1; % m^3
bulk = 1.45664e9; %Pascal
D = 28.1e-6; % m^3/rev
J = 0.0012; % kg m^2
wmMax = 13.4041 * 46; % Rad/s from MmEv. 
rpmMax = wmMax/(2*pi) * 60;
rpm = 6300; % What is this?
C = (D + VL1 + VL2)/(4*bulk); % m^3/Pa

omega_mh = D/(2*pi*sqrt(J*C)); % Gives omega_mh = 218.0518 rad/s
omega_v = 3*omega_mh; % 654.1554 rad/s

Ql = rpmMax * D * (10^3);  %l/min, checked Units OK, 


QNlMax = Ql * sqrt(215e5/(215e5-70e5)); 

Qr = 1.1 * QNlMax * sqrt(70e5/215e5); 



% PER
l_min2m3s = 1/(60*10^3);
volumetricEfficiency = 0.92;
QlMaxIdealPER = rpmMax*D/60; %m^3/s
QlMaxPer = QlMaxIdealPER/volumetricEfficiency; %m^3/s
QlMaxIdealPER_litermin = QlMaxIdealPER/l_min2m3s;
QlMaxPer_litermin = QlMaxPer/l_min2m3s;
% Per stop
%% Frequency analysis of bode plot
clear; close all; clc; 

omega_mh = 50*2*pi; % rad/s
omega_v = omega_mh/3; 
D = 28; 
rho = 875;
ps = 270e5; 
P_r = 70e5;
Cd = 0.7;
Q_r = 200/6e4;
AdMax = Q_r/(Cd * sqrt(P_r/rho));

Kqu = Cd*AdMax*sqrt(ps/rho); 

Kmh = Kqu / ((1/2*pi)*(D/10^6)); 

%% 

