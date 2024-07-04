function out = unetSuperKernelver2Derive(s,t1,t2,k)

length = 1;
c = unetDISTINVERSEver3(s,length);


if  t1 == t2 || t2 < t1 || s == 0 || t2 < c
    out = 0;
elseif t1>c
%elseif all(t1>c) && all(t2 < c)
    out = (length - unetDISTver3(s,t1))*exp(k*(length - unetDISTver3(s,t1))) - (length - unetDISTver3(s,t2))*exp(k*(length - unetDISTver3(s,t2)));
else
     
  %disp('here');
   %out = unetAdaptquarturever2(s,c+0.000000001, t2,k);
   %out = unetSimpson(s,c, t2,k);
  
   out = -(length -  unetDISTver3(s,t2) )*exp(k*(length -  unetDISTver3(s,t2) )); 

end