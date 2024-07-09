function out = unetCombinedSimpsonGamma(a,b,mu,sigma,j,k)


n = 16000;

h =(b-a)/n;



% Taylor polynomials at P4 about a  = 0;
%P4 = @(x) 1 + x + x^2/2 + x^3/6 + x^4/24;

% Taylor polynomials at P5 about a  = 0;
%P5 = @(x) 1 + x + x^2/2 + x^3/6 + x^4/24 + x^5/120;

%f = @(x) KST2(x,t1,0.07)*1;


f = @(x) gampdf(x,mu,sigma)*unetSuperAdapt(x,(j-1)*10,10*j,k);

%f = @(x) exp(x)/sqrt(x);
x = a:h:b;
%fprintf('%2.6f ',x);

%c = unetTSUPERSTAR(s,1);

%if  a > c || b < c 
%XI0 = f(a) + f(b);
XI0 = f(a) + f(b);
XI1 = 0;
XI2 = 0;

%disp(f(a))
%disp(f(b))

for  i = x(2:2:end-1)
   %fprintf('%2.6f\n',i);
    XI1 = XI1 + f(i);
end
%disp(XI1);

for  i = x(3:2:end-1)
  %  fprintf('%2.6f\n ',i);
    XI2 = XI2 + f(i);
end
%disp(XI2);

 out = (h/3)*(XI0 + 2*XI2 + 4*XI1 );
