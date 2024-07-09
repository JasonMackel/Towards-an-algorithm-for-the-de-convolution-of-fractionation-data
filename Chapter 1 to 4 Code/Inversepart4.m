

% Assume that the distributions all have intergals going to 1.


alpha = 0.000000001;
t  = eye(20,20);

I = eye(40,40);


BBT = B*B' + alpha*t;
INVBBT = inv(BBT);

for i = 1:40
     d(i) = 1;
end


d = d';
%% wrong but 

munumer = 2*(dot(B*d,INVBBT*C) - 1);
mudenmon = (norm(d)^2 - dot(B*d,INVBBT*(B*d)));

mu = munumer/mudenmon;


reg = alpha*t;

lambda = -1*INVBBT*(2*C + mu*B*d);

A1 = -0.5*((lambda'*B )' + mu*d');


%lambda'*B*alpha*I;