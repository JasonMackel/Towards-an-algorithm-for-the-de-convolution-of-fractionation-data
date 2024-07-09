
% Unet Velocity
% 15/08/2022
% This code given a size and instance in time will
% find a particular velocity of a particle in the REFLUX CLASSIFER
% using formula calculated by Kevin Gavin
%
% Input:
%       s = size of particle
%       t = time in which particle has traveled.
%
% Output:
%       if velocity is negative outputs 0
%       if velocity is positive outputs Unet.
%
%       out = velocity of the particle of size s at time t
%

function out = unetVELFAKE2
%% This part is the collated functions by compressing the variables 
%% a function that consists of two variables this is not needed because the operation can be done in the function.
% Kept for reference;
%a = 0.00166666666;
%b = 0.000002777777;
%c = 14.51;
%d = 0.002496376;
%e = 1.829382868;
%uterm =(((c + d*s^(3/2))^(1/2) - c^(1/2))^2)*(e/s);
%u =  a*s*(1 - b*s)*((-0.3473 + 0.0419*t)/1000/60/0.0049);
%unet = u - uterm;
syms s;
syms t;

Pp = 2650;  %% Particle denisty (P = 'rho')
Pf = 1541;  %% Fluid density
mu = 0.003; %% Fluid visocity
g = 9.8;    %% Gravity constant
z = 0.0018; %% Incline spacing.

%% Time,  represented as linear function. 
T = (0.0419*t)/1000/60/0.0049; 

%% Fluidized velocity formula
U = 6*(s/2000000)*T/z*(1 - (s/2000000)/z);

%% Reynold's Number
Reynold = (((14.51 + (1.83*(2*s/2000000).^(1.5)*(g*1*Pf*(Pp - Pf)).^(0.5))/mu))^(0.5) - 3.81)^2;

%% Incline angle for channel
incline = (sin((70*pi)/180));

%% Terminal velocity of particle (consists of Reynold's number)
Ut = Reynold*mu/(Pf*(2*s/2000000));

%% Terminal velocity on an incline
Utincline = Ut*incline;

%% Total particle velocity in the fluid
Unet = U - Utincline;

%ts = tSTARFAKE(s);

%% Output function where if the velocity is negative outputs 0 
%% or it outputs Unet;

 %idx = t>tSTARFAKE(s);

%if t < ts
 %  unetout = 0;
%else
 %  unetout(idx) = Unet(idx);
%end
    
%% Ouput of function;
out = int(Unet,s);