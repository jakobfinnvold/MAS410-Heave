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

% Motor selection
% Max motor moment = 82.7719 Nm
pMax = 225e5; % From HPU selection
pToMotor = pMax - pr;
D_change = 28.1;
QthMotor = rpmMax * D_change * 10^-3; 
Q_servo = QthMotor*1.08; 

Tm = D_change*0.92 * 225 / (2*pi*10); 

D_min = (2*pi*82.77)/(225e5*0.92) * 10^6; 

% Servo calculations
Cd = 0.7; 
rho = 875; 

Q_r = Q_servo *10^-3/60; 
Q_leak = Q_r - QthMotor  * 10^-3/60; 
Ad_valve = Q_servo*10^-3/(0.7*sqrt(2/875 * pr));
AdMax = Q_r/Cd/sqrt(2/rho*pr) * 10^6;
AdLeak =  Q_leak/Cd/sqrt(2/rho*(pMax))*10^6;

omega_v = 70*2*pi; 

Kqu = Cd*AdMax*sqrt(pMax/rho); %m3/rev Not included
Kmh = Kqu / ((1/2*pi)*(D/10^6)); %rad/s Not included
Kqp = Cd*AdMax/(2*sqrt(rho*pMax)); % Not included
zeta = 1;

in1 = 1/(omega_v^2); % From TF
in2 = (2*zeta)/omega_v; %For TF
 


