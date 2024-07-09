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


function out = tSTARver3(s)

[Pp,Pf,mu,t0] = loadingSilicaValues();
%% Particle denisty (P = 'rho')
%% Fluid density
%% Fluid visocity
%% Time before experiment start in mins.

g = 9.8;    %% Gravity constant
z = 0.0018; %% Incline spacing.

[lambda,v0] = loadingSilicaLinearValues();
%lambda represent as fluid flow in m/mins
%V0 represented as starting constant

%% Reynold's Number
Reynold = (((14.51 + (1.83*(2*s/2000000).^(1.5)*(g*1*Pf*(Pp - Pf)).^(0.5))/mu)).^(0.5) - 3.81).^2;

%% Incline angle for channel
incline = (sin((70*pi)/180));

%% Terminal velocity of particle (consists of Reynold's number)
Ut = Reynold*mu/(Pf*(2*s/2000000));

%% Terminal velocity on an incline
%% C_2(s)
Utincline = Ut*incline;

%% Formula rearranged from Utincline and Fluidized Velocity;
%% C_1(s)
Uloc  = (6.*(s./2000000)/z.*(1 - (s./2000000)./z));

%% Pv = Particle velocity
Pv = Uloc*v0 - Utincline;

% If Pv is greater than 0, then tstar is 0
if (Pv >= 0)
    time = 0;
else
    % time is move is this formula.
    time = t0 + (Utincline - v0*Uloc)/(lambda*Uloc);
end
   

out = time;