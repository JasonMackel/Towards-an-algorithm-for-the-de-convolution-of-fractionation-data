

%Starting time when particles start to elutrate from the system.



%Const = [1.182972592240731];

Const = [0.088403234257275];
Const = [0.002525204125050];
Const = [0.004999004745640];

  C = [10.85
13.40
12.55
16.35
21.60
30.75
40.40
47.75
65.15
81.85
58.85
76.55
95.05
142.35
];
 
[~,~,~,t0] = initialiseChalcoValues();

factor = 10;
%Starting time when particles start to elutrate from the system.
ts = t0/factor;
% Type 0 = Uniform piecewise.
% Type 1 = linear piecewise
% Type 2 = Quadratic piecewise

type = 1;
 
 for krate = 1:length(Const)
 
     rateconstant = Const(krate);
 
     for j = 1:14
 
            if j == 1
            %B(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i),sd(i),t+(j-1),1,rateconstant);
            %B(j,krate) =  unetCombinedSimpsonLINEver2(0,1,t+j,10,rateconstant,type);
            B(j,krate) =  unetCombinedSimpsonLINEChalco3ver2(0,1,0,j+ts,10,rateconstant,type);
            else
             B(j,krate) =  unetCombinedSimpsonLINEChalco3ver2(0,1,ts +(j-1),ts+j,10,rateconstant,type);
            end 
         
         disp(j)
     end
 
 end


time = 10:10:80;



figure(1);
grid on;
hold on;
scatter(time + t0 ,C(1:8,1),"filled");
scatter(time + t0,B(1:8,1),"filled");
legend("Experimental data","Model");
xlabel("Time Period");
ylabel("Mass")
title("Chalcopyrite bag mass");
xlim([(time(1) + t0 - 10) (time(length(time)) + t0 + 10)])
ylim([-10 70])
hold off;

err = immse(B(1:8),C(1:8));
 

% figure(2);
% scatter(time,C,"filled");
% legend;
% grid on;
% hold on;
% scatter(time,B(:,2),"filled");
% xlabel("Time Period");
% ylabel("Mass")
% hold off;



%  figure(3);
% scatter(time,C,"filled");
% legend;
% grid on;
% hold on;
% scatter(time,B(:,3),"filled");
% xlabel("Time Period");
% ylabel("Mass")
% hold off;


% 
% figure(4);
% scatter(time,C,"filled");
% legend;
% grid on;
% hold on;
% scatter(time,B(:,4),"filled");
% xlabel("Time Period");
% ylabel("Mass")
% hold off;
% 
% figure(5);
% scatter(time,C,"filled");
% legend;
% grid on;
% hold on;
% scatter(time,B(:,5),"filled");
% xlabel("Time Period");
% ylabel("Mass")
% hold off;
% 
% figure(6);
% scatter(time,C,"filled");
% legend;
% grid on;
% hold on;
% scatter(time,B(:,7),"filled");
% xlabel("Time Period");
% ylabel("Mass")
% hold off;

%  for krate = 1:length(Const); 
%      temp = 0;
%  
%      for j = 1:100 
%  
%          Bagweight(j,krate) = B(j,krate) - temp;
%          temp = B(j,krate);
% 
%      end
%  end
