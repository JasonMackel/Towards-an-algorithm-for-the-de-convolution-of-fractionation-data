function out = unetSuperKernelver2(s,t1,t2,k)
%length of inclined channel.
length = 1;
% time to travel inclined channel of length
c = unetDISTINVERSEver3(s,length);
% time checks and the first condition
if  t1 == t2 || t2 < t1 || s == 0 || t2 < c
    out = 0;
    % second condition if t1 past c
elseif t1>c
    out = -exp(k*length)*(exp(-k*unetDISTver3(s,t2)) - exp(-k*unetDISTver3(s,t1)) );
    % third condition if time includes c to t2.
else
    out = 1 - exp(k*(length -  unetDISTver3(s,t2) ));
end