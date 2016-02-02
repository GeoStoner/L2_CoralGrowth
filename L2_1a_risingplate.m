% Model of the fate of corals due to fluctuating oceans and subducting
% plates
% Eqns and vals from: The dynamics of foreland basin carbonate platforms
% Galewsky (1998)

% Written by Ryan Stoner jan 31, 2016

clear
clc

%% Initialize

dt = 3*10^2; % yrs: time increment
tmax = 1*10^5; % yrs
t = 0:dt:tmax; % yrs
P = 1*10^6; % yrs: period of oscillation

sealev = 120*sin(2*pi*t/P); % m: oscillation of sea level

% Defining vars for growth rate of platform
Gm = 12.5*10^-3; % m/yr: Maximum upward growth rate
k = 0.1; % 1/m: extinction coefficient
I0 = 2000; % E*10^-6*m^-2*s^-1: surface light intensity
Ik = 450; % E*10^-6*m^-2*s^-1:  light intensity

dx = 50; % m: distance increment
xmax = 2000; % m
x = -xmax:dx:xmax; % m: distance of simulation
z = 0.1 * x ; % m
zb = z; % m: initial depth of basement
ch = zeros(1,length(z)); % m: change in thickness of corals
dep = ch;
dCdt = ch; % preallocating change in growth of coral

subs = 1*10^-3; % m/yr: subsidence rate


%% Process

imax = length(t);

for i = 1:imax

    dep = sealev(i) + z; % m: depth of 
    dCdt = CorGrow(Gm,I0,k,dep,Ik,dt); % m: 6 args in, change cor growth rate
    

    
    zb = zb - (subs*dt); % m
    ch = ch + (dCdt*dt); % m
    z = zb - ch;
    
  
    figure(1) % Plotting the coral on top of the land
   
    fill(x,z,'c')
    
    

    
    hold on
    plot(x,-sealev(i)*ones(length(x))) % Plotting sea level  
    ax =gca;
    ax.YDir = 'reverse';
    ylim([-100 100]) % vertical exaggeration
    hold off
    
    pause(0.001)
    
    
end