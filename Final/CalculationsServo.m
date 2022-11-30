clear; close all; clc; 

pr = 70e5; % Pascal
VL1 = 1e-3; % m^3
VL2 = VL1; % m^3
bulk = 1.45664e9; %Pascal
D = 28.1e-6; % m^3/rev
J = 0.0012; % kg m^2
wmMax = 13.4041 * 46; % Rad/s from MmEv. 
rpmMax = wmMax/(2*pi) * 60;
rpm = 6300; 

C = (D + VL1 + VL2)/(4*bulk); % m^3/Pa

omega_mh = D/(2*pi*sqrt(J*C)); % Gives omega_mh = 218.0518 rad/s
omega_v = 3*omega_mh; % 654.1554 rad/s

Ql = rpmMax/60 * D * (10^3*60); %179

QNlMax = Ql * sqrt(225e5/(225e5-70e5)); 

Qr = 1.1 * QNlMax * sqrt(70e5/225e5);
Qr1 = Ql/0.92;


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

