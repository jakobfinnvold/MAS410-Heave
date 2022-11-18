clc; clear; close all;

%HPU
omega_hpu = 6; %[rad/s], natural frequency
zeta_hpu = 1; %[-] damping 
K = 500;%constant SET AS 1. 

s = tf('s');

hpuTF = K*omega_hpu^2/(s^2+2*s*zeta_hpu*omega_hpu+omega_hpu^2);

step(hpuTF) 
grid 
title('HPU transfer')

figure
bode(hpuTF)
grid
title('HPU transfer')

%Servo valve:
omega_mh = 50*2*pi; %rad/s
omega_v = omega_mh/3; %rad/s
zeta_v = 1; %[-] damping set to one

servoTF = K*omega_v^2/(s^2+2*s*zeta_v*omega_v+omega_v^2);
figure
step(hpuTF) 
grid 
title('Servo transfer')

figure
bode(hpuTF)
grid
title('Servo transfer')