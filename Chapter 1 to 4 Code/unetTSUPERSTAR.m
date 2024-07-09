function out = unetTSUPERSTAR(s,l)

[lambda, ~] = initialiseLinearValues();
z = 0.0018;
%lambda = 0.000163003;

U = 6.*(s/2000000)/z.*(1 - (s./2000000)./z);
tstar = tSTARver2(s);

fprime = lambda.*U;

out = tstar + sqrt((2.*l)./fprime);