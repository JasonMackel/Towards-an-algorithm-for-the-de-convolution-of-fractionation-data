% T Star Function
% 15/08/2022
% This code given a size will find the first instance where the 
% velocity will become positive.
%
% Input: 
%      s: particle size.
%
% Output:
%      out : Time at which velocity becomes positive in the REFLUX
%      CLASSIFER.
%


function out = tSTARFAKE(s)

Pp = 2650;  %% Particle denisty (P = 'rho')
Pf = 1541;  %% Fluid density
mu = 0.003; %% Fluid visocity
g = 9.8;    %% Gravity constant
z = 0.0018; %% Incline spacing.

%% Time function, represented as linear (From Unet)
%T = ((-0.3473 + 0.0419*t)/1000/60/0.0049); 

%% Fluidized velocity formula (From Unet)
%U = 6*(s/2000000)*T/z*(1 - (s/2000000)/z);

%% Reynold's Number
Reynold = (((14.51 + (1.83*(2*s/2000000).^(1.5)*(g*1*Pf*(Pp - Pf)).^(0.5))/mu)).^(0.5) - 3.81).^2;

%% Incline angle for channel
incline = (sin((70*pi)/180));

%% Terminal velocity of particle (consists of Reynold's number)
Ut = Reynold*mu/(Pf*(2*s/2000000));

%% Terminal velocity on an incline
Utincline = Ut*incline;

%% Formula rearranged from Utincline and Fluidized Velocity;
Temp = (Utincline)./(6.*(s./2000000)/z.*(1 - (s./2000000)./z));

%% Rearrange the particle in an instance of Time;
%T = (Temp)/(0.0419/1000/60/0.0049);

%T = ((Temp) - 0.002502*60)/(0.000163003*60);

T = ((Temp))/(0.000163003);


%% Output of velocity.
out = T;