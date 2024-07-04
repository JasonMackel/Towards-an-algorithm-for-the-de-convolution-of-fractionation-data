e
clear all;
%Making numerical normal distributions with mu and SD with entire feed in the range

%% Part 1  p << n
%mu = [28 63 125 250 475];
%sd = [5 14 20 30 30];


%% Part 2 n << p
 n = 5;
 
 a = 50;
 b = 900;
 
 h = (b - a)/n;
 
 x = a:h:b; % generating mus
 
 for i = 1:n
     mu(i) = a + h*(i-1);
     sd(i) = 30;
 end

% a1 = randi([150 450],1,40);
% a2 = randi([451 750],1,40);

%a = 150;
%b = 750;
%h = (b - a)/40;

%for i = 1:40
  %  a1(i) = a + h*(i-1);
 %   a2(i) = (a + 2) + h*i;
%end

%Starting time when particles start to elutrate from the system.
t = 0;

for i = 1:length(mu)
    
        AdaptONES(i,1) = unetFeedAdaptquart(0,1000,mu(i),sd(i),1);
        SimpsonONES(i) = unetFeedSimpson(0,1000,mu(i),sd(i),1);

end




  for j = 1:20
 
         C(j,1) = unetCombinedSimpsonUniform(200,800,t+(j-1),1);
  
  end

% rateconstant = 0.01;

  %for j = 1:20
 
      %Z = unetCombinedAdaptquart(200,700,450,30,t + (j -1));
  %       Z = unetCombinedSimpsonUniform(200,700,t+(j-1),rateconstant);          
 %        C(j,1) = Z + 0.0001*randn;
  
%  end


%   C = [1.00
% 2.10
% 3.50
% 4.20
% 6.90
% 11.7
% 21.80
% 44.20
% 58.60
% 61.35
% 61.75
% 68.40
% 70.50
% 62.70
% 78.90
% 68.70
% 63.50
% 70.30
% 62.50
% 39.90
% 122.4
% ];
 

% 
% 
%   for j = 1:21
% 
%       for i = 1:length(mu)
% 
%           B(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i),sd(i),t+(j-1),1,rateconstant);
%       end
%       disp(j)
%   end

  % for j = 1:20
 
 %    for i = 1:length(a1)
    
  %      B(j,i) = unetCombinedSimpsonUniform(a1(i),a2(i),t+(j-1));
 %     end
 
%  end

% clear B;
%    for j = 1:20
%  
%      for i = 1:length(mu)
%     
%          B2(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i),sd(i),t+(j-1),1,0.5);
%       end
%   
%   end




%a = [1/5;1/5;1/10;1/10;2/5];
%c = B*a;
%c = sum(B,2);
% BTB = B'*B;
% invB = inv(BTB);
% d = [1;1;1;1;1];
% %d = [1;1];
% BTC = B'*C;
% 
% 
% Numerator = dot(invB*BTC,d) - 1;
% Frac = Numerator/dot(invB*d,d);
% 
% twopart = Frac*d;
% 
% inner = BTC-twopart;
% 
% A = invB*inner;

% f1 = @(x) 1/(5*sqrt(2*pi))*exp(-(x-38)^2/(2*5^2));
% f2 = @(x) 1/(9*sqrt(2*pi))*exp(-(x-63)^2/(2*9^2));
% f3 = @(x) 1/(20*sqrt(2*pi))*exp(-(x-125)^2/(2*20^2));
% f4 = @(x) 1/(30*sqrt(2*pi))*exp(-(x-250)^2/(2*30^2));
% f5 = @(x) 1/(30*sqrt(2*pi))*exp(-(x-475)^2/(2*30^2));
% 
% 
% 
% 
% 
% % Making a uniform distribution considering particle sizes 38 - 780 
% 
% % first particle size 38
% % final particle size 780
% 
% i = 36;
% sum1 = 0;
% sum2 = 0;
% sum3 = 0;
% sum4 = 0;
% sum5 = 0;
% 
% B = zeros(20,5);
% x = 0;
% J = 1;
% 
% 
% 
% 
% for j = 1:20
% 
%     x = 0;
%     J = 1;
%     
%     while x < 6
%         disp(x);
% 
% 
%         increment = 2^(J-1);
%         %  disp(incr)
% 
% 
%         for s = 1:1:increment*742
%             temp1 = unetSuperAdapt(38 + s*(1/increment),10*(i-1),10*i)*f1(38 + s*(1/increment));
%             temp2 = unetSuperAdapt(38 + s*(1/increment),10*(i-1),10*i)*f2(38 + s*(1/increment));
%             temp3 = unetSuperAdapt(38 + s*(1/increment),10*(i-1),10*i)*f3(38 + s*(1/increment));
%             temp4 = unetSuperAdapt(38 + s*(1/increment),10*(i-1),10*i)*f4(38 + s*(1/increment));
%             temp5 = unetSuperAdapt(38 + s*(1/increment),10*(i-1),10*i)*f5(38 + s*(1/increment));
%             sum1 = sum1 + temp1;
%             sum2 = sum2 + temp2;
%             sum3 = sum3 + temp3;
%             sum4 = sum4 + temp4;
%             sum5 = sum5 + temp5;
%         end
% 
%         RESULT1(J) = sum1*(1/increment);
%         RESULT2(J) = sum2*(1/increment);
%         RESULT3(J) = sum3*(1/increment);
%         RESULT4(J) = sum4*(1/increment);
%         RESULT5(J) = sum5*(1/increment);
% 
% 
%         sum1 = 0;
%         sum2 = 0;
%         sum3 = 0;
%         sum4 = 0;
%         sum5 = 0;
% 
% 
%         if J >= 2
%             disp(1 - RESULT1(J-1)/RESULT1(J))
%         end
%         
%         x = x + 1;
%         if x < 6
%             J = J + 1;
%         end
% 
%     end
%     i = i + 1;
%     B(j,1) = RESULT1(J);
%     B(j,2) = RESULT2(J);
%     B(j,3) = RESULT3(J);
%     B(j,4) = RESULT4(J);
%     B(j,5) = RESULT5(J);
% end
