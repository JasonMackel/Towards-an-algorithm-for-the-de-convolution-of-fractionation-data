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

function out = unetVELChalcover3(s,t)


[Pp,Pf,mu,t0] = loadingChalcoValues();
%% Particle denisty (P = 'rho')
%% Fluid density
%% Fluid visocity
%% Time before experiment start in mins.

g = 9.8;    %% Gravity constant
z = 0.0018;  %% Incline spacing.


%% Time,  represented as linear function. 
[lambda, v0] = loadingChalcoLinearValues();

%% Fluidized velocity formula
%% C_1(s)
Uloc = (6.*(s/2000000)./z).*(1 - (s/2000000)/z);

%% Reynold's Number
Reynold = (((14.51 + (1.83*(2*s/2000000).^(1.5)*(g*1*Pf*(Pp - Pf)).^(0.5))/mu)).^(0.5) - 3.81).^2;

%% Incline angle for channel
incline = (sin((70*pi)/180));

%% Terminal velocity of particle (consists of Reynold's number)
Ut = Reynold*mu/(Pf*(2*s/2000000));

%% Terminal velocity on an incline
%% C_2(s)
Utincline = Ut*incline;

%% Total particle velocity in the fluid

if (t <= t0)
    Unet = Uloc*v0 - Utincline;
else
    Unet = Uloc*(lambda*(t - t0) + v0) - Utincline;
end

%ts = tSTARver2(s);

ts = tSTARChalcover3(s);
%% Output function where if the velocity is negative outputs 0 
%% or it outputs Unet;

%% idx = t>tSTARver2(s);

if t <= ts
   unetout = 0;
else
   unetout = Unet;
end
    
%% Ouput of function;
out = unetout;