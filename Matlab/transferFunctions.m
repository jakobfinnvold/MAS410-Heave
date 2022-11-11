clc; clear; close all;

%HPU
omega_hpu = 6; %[rad/s], natural frequency
zeta_hpu = 1; %[-] damping 
K = 1;%constant SET AS 1. 

s = tf('s');

hpuTF = K*omega_hpu^2/(s^2+2*s*zeta_hpu*omega_hpu+omega_hpu^2);

step(hpuTF) 
grid 

figure

bode(hpuTF)

grid
