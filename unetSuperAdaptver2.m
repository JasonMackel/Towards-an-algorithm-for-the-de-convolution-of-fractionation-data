function out = unetSuperAdaptver2(s,t1,t2,k)

c = unetTSUPERSTAR(s,1);
%c= 0;
%sub = 20000;


if  t1 == t2 || t2 < t1 || s == 0 || t2 < c

    out = 0;

elseif t1>c
%elseif all(t1>c) && all(t2 < c)
    out = unetAdaptquarturever2(s,t1,t2,k);

else
     
  %disp('here');
   out = unetAdaptquarturever2(s,c+0.000000001, t2,k);
   %out = unetSimpson(s,c, t2,k);

end