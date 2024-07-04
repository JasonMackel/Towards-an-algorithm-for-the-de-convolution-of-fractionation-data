function out = unetCombinedSimpsonUnknownChalco(a,b,mu,sd,j,k,factor)



n = 32000;

h =(b-a)/n;


%[LSx, LSy] = initaliseLaserData();

%Discretisation of points
x = a:h:b;


% 
% if degree == 1
%     Result = piecewiseline(x);
% else
%     Result = piecewise2(x);
% end




 f = @(x) unetSuperKernelChalco(x,(j-1)*factor,j*factor,k);

g = @(x) (exp(-((x-mu).^2)/(2*sd.^2)) / (sd*sqrt(2*pi)));

% if degree == 1
%     f = @(x) piecewiseline(x/b)*unetSuperAdapt(x,(j-1)*10,10*j,k);
% else
%      f = @(x) piecewise2(x/b)*unetSuperAdapt(x,(j-1)*10,10*j,k);
% end

%XI0 case the end points;


XI0 =g(a/2)*f(a*2000) + g(b/2)*f(b*2000);
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
        XI1 = XI1 + g(x(i)/2)*f(x(i)*2000);
    else
        XI2 = XI2 + g(x(i)/2)*f(x(i)*2000);
    end
    
    
%     if i == 2000
%         disp(Result(i)*f(x(i)*2000));
%     end

end



 out = (h/3)*(XI0 + 2*XI2 + 4*XI1 );