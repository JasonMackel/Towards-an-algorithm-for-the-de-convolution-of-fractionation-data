
%clear all;
%Making numerical normal distributions with mu and SD with entire feed in the range

%% Part 1  p << n
%mu = [28 63 125 250 475];
%sd = [5 14 20 30 30];


%% Part 2 n << p
 n = 40;
 
 a = 150;
 b = 750;
 
 h = (b - a)/n;
 
 x = a:h:b; % generating mus
 
 for i = 1:40
     mu(i) = a + h*(i-1);
     sd(i) = 30;
 end

 a1 = randi([150 450],1,40);
 a2 = randi([451 750],1,40);

a = 150;
b = 750;
h = (b - a)/40;

for i = 1:40
    a1(i) = a + h*(i-1);
    a2(i) = (a-0.0000001) + h*i;
end

%Starting time when particles start to elutrate from the system.
t = 36;

for i = 1:length(mu)
    
        AdaptONES(i) = unetFeedAdaptquart(0,1000,mu(i),sd(i),1);
        SimpsonONES(i) = unetFeedSimpson(0,1000,mu(i),sd(i),1);

end




%  for j = 1:20
% 
%         C(j,1) = unetCombinedSimpsonUniform(200,800,t+(j-1));
%  
%  end

 

  for j = 1:20
 
         Z = unetCombinedSimpsonGamma(0,1000,15,30,t+(j-1),0.1);
         C(j,1) = Z + 0.00001*randn;
  
  end

 
%   for j = 1:20
%  
%      for i = 1:length(mu)
%     
%         B(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i),sd(i),t+(j-1),1);
%       end
%  
%   end

   for j = 1:20
 
     for i = 1:length(a1)
    
        B(j,i) = unetCombinedSimpsonUniform(a1(i),a2(i),t+(j-1),1);
      end
 
  end

% clear B;
%   for j = 1:20
% 
%     for i = 1:2
%     
%         B2(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i+2),sd(i+2),t+(j-1),0.5);
%      end
%  
%  end

