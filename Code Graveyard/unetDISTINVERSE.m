function time = unetDISTINVERSE(s,d)

%dist = 0;

%for i = 1:t
%   dist = dist + unetVEL(s,i);
%end

%% Need the formula for Unet, stating variables.. 
syms R;
ts = tSTAR(s);


%out = dist;
Pp = 2650;  %% Particle denisty (P = 'rho')
Pf = 1541;  %% Fluid density
mu = 0.003; %% Fluid visocity
g = 9.8;    %% Gravity constant
z = 0.0018; %% Incline spacing.

%% Time,  represented as linear function.
%T = ((-0.3473 + 0.0419*t)/1000/60/0.0049); 


%% Fluidized velocity formula
U = 6*(s/2000000)/z*(1 - (s/2000000)/z);

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

%y = (sqrt(2*d+ ((Utincline)^2)/U) + (Utincline)/sqrt(U))/sqrt(U) ;
% time = y;
%f = int(Unet);
%g = finverse(f);
%R = d + int(Unet,0,tSTAR(22.6));

%time = subs(g);

g = (ts + sqrt(ts.^2 + (8*d)/U))/2;

time = g;
