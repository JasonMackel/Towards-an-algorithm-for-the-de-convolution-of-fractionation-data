function out = unetAdaptquarturever1derive(s,a,b,k)

 aa = a;
 
 
 ori= s;
 
 bb = b;
 n = 50;
 eps = 0.00001;


  %f = @(x) x;
 % f = @(x) x - cos(x);
 f = @(x) KSTver1derive(s,x,k);
    

 cnt = 0;
 app = 0;
 i = 1;
 tol = zeros(1,n);
 a = zeros(1,n);
 h = zeros(1,n);
 fa = zeros(1,n);
 fc = zeros(1,n);
 fb = zeros(1,n);
 s = zeros(1,n);
 l = zeros(1,n);
 fd = zeros(1,n);
 fe = zeros(1,n);



 v = zeros(1,7);
 tol(i) = 10*eps;
 a(i) = aa;
 h(i) = 0.5*(bb-aa);
% fprintf('This is H(i) %i', bb);
 %fprintf('This is H(i) %i', a(i));
 fa(i) = f(aa);
 cnt = cnt+1;
 fc(i) = f((aa+h(i)));

 %fprintf('This is H(i) %i', aa + h(i));
 cnt = cnt+1;
 fb(i) = f(bb);
 cnt = cnt+1;


 s(i) = h(i)*(fa(i)+4*fc(i)+fb(i))/3;
% fprintf('%i\n',s(i));
 
 l(i) = 1;
% level = true;

 while i > 0 
   fd = f((a(i)+0.5*h(i)));
   cnt = cnt+1;
   fe = f((a(i)+1.5*h(i)));
   cnt = cnt+1;
   s1 = h(i)*(fa(i)+4*fd+fc(i))/6;
   s2 = h(i)*(fc(i)+4*fe+fb(i))/6;
   v(1) = a(i);
   v(2) = fa(i);
   v(3) = fc(i);
   v(4) = fb(i);
   v(5) = h(i);
   v(6) = tol(i);
   v(7) = s(i);
   lev = l(i);
   % fprintf('\nSolution found as   p = %2.12f   with   tol = %1.0e   in %4d iterations\n\n',p,TOL,i)
         %out = p;
  % fprintf('%i , %i\n', lev, v(7));
   i = i-1;

 %  fprintf('%i , %i\n', s1+s2-v(7), v(6));
   if abs(s1+s2-v(7)) < v(6) %|| level == false
     app = app+(s1+s2);
   else
     if lev >= n
       fprintf('Procedure fails %i \n',ori);
       break;
     else
      i = i+1;
      a(i) = v(1)+v(5);
      fa(i) = v(3);
      fc(i) = fe;
      fb(i) = v(4);

      h(i) = 0.5*v(5);
      tol(i) = 0.5*v(6);
      s(i) = s2;
      l(i) = lev+1;
      i = i+1;
      a(i) = v(1);
      fa(i) = v(2);
      fc(i) = fd;
      fb(i) = v(3);
      h(i) = h(i-1);
      tol(i) = tol(i-1);
      s(i) = s1;
      l(i) = l(i-1);
     end
   end
 end

 
out = app;