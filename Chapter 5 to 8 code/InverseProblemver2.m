clear all;

%Making numerical normal distributions with mu and SD with entire feed in the range

%% Part 1  p << n
%mu = [28 63 125 250 475];
%sd = [5 14 20 30 30];


%% Part 2 n << p
 n = 29;
  %a = 0.0082;
  a = 0.0106;
    factor = 1.136;

 for i = 1:n
     if i == 1
     else
         a = a*factor;
     end
     Uniform(1,i) = a;
     Uniform(2,i) = a*factor;
 end


%Starting time when particles start to elutrate from the system.
 t = 1;

% krate constant 
 Const = [0.2112];
 Const = [0.013798012943035];
 
   C = [1.00
 2.10
 3.50
 4.20
 6.90
 11.7
 21.80
 44.20
 58.60
 61.35
 61.75
 68.40
 ];
% 
% 
 for krate = 1:length(Const)
 
     rateconstant = Const(krate);
 
     for j = 1:12
 
         for i = 1:n

             if j == 1
            B(j,i) = unetCombinedSimpsonUnknownUniform(0,2,Uniform(1,i),Uniform(2,i),1,rateconstant,10) + unetCombinedSimpsonUnknownUniform(0,2,Uniform(1,i),Uniform(2,i),2,rateconstant,10) + unetCombinedSimpsonUnknownUniform(0,2,Uniform(1,i),Uniform(2,i),3,rateconstant,10);

           else 
 
            B(j,i) = unetCombinedSimpsonUnknownUniform(0,2,Uniform(1,i),Uniform(2,i),2+j,rateconstant,10);
             end
         end
         disp(j)
     end
 end
     alpha = 0.0001;
 
     BTB = B'*B + alpha*eye(n);
     invB = inv(BTB);
 
     for i = 1:n
         d(i,1) = 1;
     end
 
     BTC = B'*C;
 
 
     Numerator = dot(invB*BTC,d) - 1034;
     Frac = Numerator/dot(invB*d,d);

     twopart = Frac*d;
 
     inner = BTC-twopart;
     A1(:,krate) =  invB*inner;
% 
% %     SS = [-1000 19 45/2 63/2 90/2 125/2 180/2 250/2 355/2 250 2000 ];
% % 
% %     Sizings = zeros(n,length(SS)-1);
% % 
% %     for i = 1:length(SS)-1
% % 
% %         for j = 1:n
% %             Sizings(j,i) =  0.5*(1 + erf((SS(i+1)-mu(j))/(sd(j)*sqrt(2)))) - 0.5*(1 + erf((SS(i)-mu(j))/(sd(j)*sqrt(2))));
% % 
% %         end
% %     end
% % 
% % 
% % 
% %     i = 0;
% % 
% %     A2 = A1(:,krate)';
% %     for i = 1:length(Result)
% %         S1 = Sizings(:,i);
% %         Result(i,krate) = A2*S1;
% %     end
% 
% 
% end
