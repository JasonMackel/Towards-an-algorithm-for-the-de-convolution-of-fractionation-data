function out = unetSource(a,b)


n = 4000;

h =(b-a)/n;

% Taylor polynomials at P4 about a  = 0;
%P4 = @(x) 1 + x + x^2/2 + x^3/6 + x^4/24;

% Taylor polynomials at P5 about a  = 0;
%P5 = @(x) 1 + x + x^2/2 + x^3/6 + x^4/24 + x^5/120;

%f = @(x) KST2(x,t1,0.07)*1;


f = @(x) 1*(1/(b - a));

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

%else
    
 % disp("Singularity detected");
%     if a < c
%         disp("heree");
%         xleft = a:h:c;
%         XI0left = f(a);
%         XI1left = 0;
%         XI2left = 0;
% 
%         for  i = xleft(2:2:end-1)
%             % fprintf('%2.6f \n',i);
%             %fprintf('%2.6f ',h);
%             XI1left = XI1left + f(i);
%         end
% 
% 
%         for  i = xleft(3:2:end-1)
%             %  fprintf('%2.6f ',i);
%             XI2left = XI2left + f(i);
%         end
% 
% 
%         fprintf('%2.6f \n',XI0left);
%         fprintf('%2.6f \n',XI2left);
%         fprintf('%2.6f \n',XI1left);
% 
%         out = (h/3)*(XI0left + 2*XI2left + 4*XI1left );
% 
%     end
% 
% 

%disp(c);
%out  = 0;