% 2nd part of the inverse formula without

% n << p long skinny matrix.

alpha = 1;
%a = [1/6;1/6;1/12;1/12;2/6;1/6];

I = eye(5,5);

c = sum(B,2);
%c = B*a;
BTB = B'*B + alpha*I;

invB = inv(BTB);
d = [1;1;1;1;1];
%d = [1;1];
BTC = B'*C;

lambda = (dot(invB*BTC,d) - 1) / (dot(invB*d,d));


A = invB*(BTC - (lambda)*d);
A1 = A;