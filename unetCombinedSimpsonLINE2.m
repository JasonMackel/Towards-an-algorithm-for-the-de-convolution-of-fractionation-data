function out = unetCombinedSimpsonLINE2(a,b)


n = 16000;

h =(b-a)/n;



x = a:h:b;

%[LSx, LSy] = initaliseLaserData();

%Discretisation of points
x = a:h:b;


f = @(x) piecewise2(x);
%XI0 case the end points;


XI0 = f(a) + f(b);
XI1 = 0;
XI2 = 0;



% for  i = x(2:2:end-1)
%     XI1 = XI1 + Result(i)*f(i);
% end
% 
% 
% for  i = x(3:2:end-1)
% 
%     XI2 = XI2 + Result(i)*f(i);
% end


for i = 2:length(x)-1
 
    if (mod(i,2) == 0)
        XI1 = XI1 + f(x(i));
    else
        XI2 = XI2 + f(x(i));
    end

end




 out = (h/3)*(XI0 + 2*XI2 + 4*XI1 );