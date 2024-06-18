function out = unetCombinedSimpsonLINE3ver3(a,b,j1,j2,factor,k,degree)
% if want to increase the number of subdivisions
if k == 1
    n = 32000;
else
    n = 16000;
end
% step size
h =(b-a)/n;
% intervals
x = a:h:b;
% selection interpolation
if degree == 1
    % linear interpolation
    Result = piecewiseline(x);
else
    %uniform interpolation
    Result = piecewise2(x);
end

% To calculate the L_i
f = @(x) unetSuperKernelver2(x,j1*factor,j2*factor,k);

% Calcuating the model bag weights
XI0 = Result(1)*f(a*2000) + Result(length(x))*f(b*2000);
XI1 = 0;
XI2 = 0;

for i = 2:length(x)-1

    if (mod(i,2) == 0)
        XI1 = XI1 + Result(i)*f(x(i)*2000);
    else
        XI2 = XI2 + Result(i)*f(x(i)*2000);
    end

end
% Result of integral
out = (h/3)*(XI0 + 2*XI2 + 4*XI1 );