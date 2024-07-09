
alpha = 0.0001;

 BTB = B'*B + alpha*eye(n);
 invB = inv(BTB);

for i = 1:n
     d(i,1) = 1;
end

 BTC = B'*C;
 
 
 Numerator = dot(invB*BTC,d) - 1;
 Frac = Numerator/dot(invB*d,d);
 
 twopart = Frac*d;

 inner = BTC-twopart; 
 A1 = invB*inner;