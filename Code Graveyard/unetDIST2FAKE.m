% Unet Distance
% 15/08/2022
% This code given a size and instance in time will
% find a distance of a particle in the REFLUX CLASSIFER by using the
% integral and using formula calculated by Kevin Gavin
%
% Input:
%       s = size of particle
%       t = time in which particle has traveled.
%
% Output:
%       Using tStar function to find the first instance of the particle
%       moving forward it outputs:
%       
%       0 if t is less than tStar otherwise 
%       
%       calculates the integral using T and tstar as the endpoints
%       
%       Distance = C1(x)Unet((t-tStar)^2)/2 - C2(x)(t-tStar)
%

function out = unetDIST2FAKE(s,t)

%dist = 0;

%for i = 1:t
%   dist = dist + unetVEL(s,i);
%end

%% Need the formula for Unet, stating variables.. 
ts = tSTARFAKE(s);


%out = dist;
Pp = 2650;  %% Particle denisty (P = 'rho')
Pf = 1541;  %% Fluid density
mu = 0.003; %% Fluid visocity
g = 9.8;    %% Gravity constant
z = 0.0018; %% Incline spacing.

%% Time,  represented as linear function.
T = ((0.0419*((t).^2/2))/1000/60/0.0049); 

T2 = ((0.0419*((ts).^2/2))/1000/60/0.0049); 

%% Fluidized velocity formula
U = 6*(s/2000000)*T/z*(1 - (s/2000000)/z);
    
U2 = 6*(s/2000000)*T2/z*(1 - (s/2000000)/z);

%% Reynold's Number
Reynold = (((14.51 + (1.83*(2*s/2000000).^(1.5)*(g*1*Pf*(Pp - Pf)).^(0.5))/mu))^(0.5) - 3.81)^2;

%% Incline angle for channel
incline = (sin((70*pi)/180));

%% Terminal velocity of particle (consists of Reynold's number)
Ut = Reynold*mu/(Pf*(2*s/2000000));

%% Terminal velocity on an incline
Utincline = Ut*incline;

%% Total particle velocity in the fluid
Unet = U - U2 - Utincline*(t-ts);





if t < ts
    unetout = double(0);
else
    unetout = Unet;
end


    
%% Ouput of function;
out = double(unetout);