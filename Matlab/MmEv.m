clear; close all; clc; 
%Parameters
rd = 0.225;
m = 9000;
g = 9.81;
dd = 0.45;
nsh = 3;
i_g = 46;
mu_eq = 0.15;
w0 = 5; 

% Variables
Dm = 200; %Cm3/rev
nom_w = 421; %rad/s
sp_drop = 10; 

%Time integration
Time = 0.0;
EndTime = 30.0; 
Counter = 1;
StepTime = 1e-4;

    Mm1 = ((m*g*dd)/(2*nsh*2*i_g)) * (1 + mu_eq*tanh(1000000/w0)); 


while Time < EndTime
    %Platform position
    Zp = 0.8*sin(pi/5 * Time);
    ZpDot = ((4*pi*cos(pi*Time/5))/25); 
    ZpDotDot = -((4*pi*sin(pi*Time/5))/125); 

    %Mass position
    Zm = -0.8*sin((pi)/5 * Time);
    ZmDot = -(4*pi*cos(pi*Time/5)/25);
    ZmDotDot = (4*pi*sin(pi*Time/5)/125); 

    % Wm
    w_D = 6*ZmDot/rd; 
    w_m = 46*w_D; 

    %Mm
    Mm = ((m*g*dd)/(2*nsh*2*i_g)) * (1 + mu_eq*tanh(w_m/w0)); 

    TimePlot(Counter) = Time;
    zPlot(Counter) = Zp;
    wPlot(Counter) = ZpDot;
    aPlot(Counter) = ZpDotDot; 
    zmPlot(Counter) = Zm; 
    zmDotPlot(Counter) = ZmDot; 
    zmDotDotPlot(Counter) = ZmDotDot; 
    wmPlot(Counter) = w_m;
    MmPlot(Counter) = Mm;

    Time = Time + StepTime;
    Counter = Counter + 1; 



end 
plot(TimePlot, zPlot);
xlabel('Time in seconds');
ylabel('Height in m'); 
hold on

plot(TimePlot, zmPlot, 'LineWidth', 1.5);
xlabel('Time in seconds');
ylabel('Height in m'); 
hold on

t1pos = max(zPlot); 
plot(2.4824, t1pos, 'o', 'MarkerSize' , 10);
legend('Platform', 'Mass', 't = 2.4824s');

figure
plot(TimePlot, wPlot); 
xlabel('Time in seconds');
ylabel('Velocity in m/s'); 
hold on

plot(TimePlot, zmDotPlot); 
t1vel = max(zmDotPlot); 
hold on

plot(4.9932, t1vel, 'o', 'MarkerSize', 10);
legend('Velocity of platform', 'Velocity of mass', 'Max Velocity at t = 4.9932')

figure
plot(TimePlot, aPlot); 
xlabel('Time in seconds');
ylabel('Acceleration in m/s^2'); 

figure
plot(TimePlot, wmPlot); 
xlabel('Time in seconds');
ylabel('Velocity in rad/s'); 

figure
plot(TimePlot, MmPlot); 
xlabel('Time in seconds');
ylabel('Motor Moment in Nm'); 


a = max(abs(aPlot)); 
w = max(abs(wPlot)); 
wmMax = max(abs(wmPlot)); 