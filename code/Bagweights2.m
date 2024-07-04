
clear all;

%Starting time when particles start to elutrate from the system.



Const = [1];


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
 
F = [23.76689167
55.76078431
91.41112183
230.356027
202.0185792
245.4388621
235.8406943
205.6750241
131.6320154
0.457055609
0

];





%Starting time when particles start to elutrate from the system.
t = 0;
% Type 0 = Uniform piecewise.
% Type 1 = linear pievewise
% Type 2 = Quadratic piecewise

type = 1;


for krate = 1:length(Const)

    rateconstant = Const(krate);

    for j = 1:60


           %B(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i),sd(i),t+(j-1),1,rateconstant);
           B(j,krate) =  unetCombinedSimpsonLINE3(0,1,t+j,10,rateconstant,type);
           
        
        disp(j)
    end

end


time = 1:1:20;






figure(1);
scatter(time,C,"filled");
legend;
grid on;
hold on;
scatter(time,B(:,1),"filled");
xlabel("Time Period");
ylabel("Mass")
hold off;

 

figure(2);
scatter(time,C,"filled");
legend;
grid on;
hold on;
scatter(time,B(:,2),"filled");
xlabel("Time Period");
ylabel("Mass")
hold off;



 figure(3);
scatter(time,C,"filled");
legend;
grid on;
hold on;
scatter(time,B(:,3),"filled");
xlabel("Time Period");
ylabel("Mass")
hold off;


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
