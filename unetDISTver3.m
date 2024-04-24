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

function out = unetDISTver3(s,t)

[Pp,Pf,mu,t0] = loadingSilicaValues();
%% Particle denisty (P = 'rho')
%% Fluid density
%% Fluid visocity
%% Time before experiment start in mins.

g = 9.8;    %% Gravity constant
z = 0.0018;  %% Incline spacing.


%% Time,  represented as linear function. 
[lambda, v0] = loadingSilicaLinearValues();

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

ts = tSTARver3(s);

% If particle velcoity positive.
if (Pv >= 0) 
    % Calculate distance travelled
    if (t < t0)
        % if less than initial start time
        distance = t.*Pv;
    else
        distance = t.*Pv + lambda./2.*Uloc.*(t - t0).^2;
    end
else
    % distance is 0, if t is less than tstar
    if t < ts
        distance = 0;
    else
        % calcuate distance particle traveled
        distance = (lambda.*Uloc/2).*(t - ts).^2;
    end
end
 
%% Ouput of function;
out = distance;