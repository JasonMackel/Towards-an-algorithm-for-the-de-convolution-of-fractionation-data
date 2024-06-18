function out = unetSuperAdaptChalcover1derive(s,t1,t2,k)

c =  unetDISTINVERSEChalcover3(s,1);
%c= 0;
%sub = 20000;


if  t1 == t2 || t2 < t1 || s == 0 || t2 < c

    out = 0;

elseif t1 > c 
%elseif all(t1>c) && all(t2 < c)
    out = unetAdaptquartureChalcover1derive(s,t1,t2,k);

else
    
  
    tau = 1;

    if (t2 - c) < 1
        tau = (t2 - c);
    end
    

    i = 0;
    init = Inf;
    Ans = 0;

    while  (i < 30)
        
        init = unetAdaptquartureChalcover1derive(s,c + tau/(2^(i+1)),c + tau/(2^i),k);
        Ans = Ans + init;
        i = i + 1;
    end
   out = Ans + unetAdaptquartureChalcover1derive(s,c + tau, t2,k);

end