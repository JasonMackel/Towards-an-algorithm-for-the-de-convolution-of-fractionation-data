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

function out = unetDISTINVERSEChalcover3(s,d)


%% Need the formula for Unet, stating variables.. 
ts = tSTARChalcover3(s);


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


%% Pv = Particle velocity
Pv = Uloc.*v0 - Utincline;


if (Pv >= 0)

    if (0 < d) && (d < t0*Pv)
        z = d/Pv;
    else

    z = (lambda*Uloc*t0 - Pv + sqrt((Pv)^2 - 2*lambda*Uloc*t0*Pv + 2*lambda*Uloc*d))/(lambda*Uloc);

    end
else
    z = ts + sqrt((2.*d)/(lambda.*Uloc));
end


if d < 0
   z = 0;
end



    
%% Ouput of function;
out = z;