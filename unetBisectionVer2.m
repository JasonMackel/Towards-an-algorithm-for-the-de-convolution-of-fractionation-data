function [out,K,FK] = unetBisectionVer2(a,b)

TOL = 1e-30;
maxiter = 100;

FA =  bisectionFunctVer2(a);
FB =  bisectionFunctVer2(b);

if FA*FB >= 0
   % fprintf('Change the interval [a,b]\n')
    out = 0;
    return
end

%fprintf('%f\n', FA);
%fprintf('%f\n', FB);

K(1) = a;
K(2) = b;

FK(1) = FA;
FK(2) = FB;

i = 1;
j = 2;


prevs = 0;
while i < maxiter
     p = a + (b-a)/2; % computing p 
     K(j+i)= p;
     FP =   bisectionFunctVer2(p);
     FK(j+i) = FP;
     if FP == 0 || (b-a)/2 < TOL
        % fprintf('\nSolution found as   p = %2.12f   with   tol = %1.0e   in %4d iterations\n\n',p,TOL,i)
         
         if  FP  < 0
           % fprintf('Bisection is FP = %2.12f\n ',FP);
            out = prevs;
           % out = p;
         else
            out = p;
         end
         return;
     end

     i = i + 1;
     if FA*FP > 0
         a = p;
         FA = FP;
     else
         b = p;
         
     end
     prevs = p;
    fprintf('%f\n', a);
    fprintf('%f\n', b);
end


out = p;