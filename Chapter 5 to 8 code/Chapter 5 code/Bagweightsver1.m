

%Starting time when particles start to elutrate from the system.



%Const = [1.182972592240731];

%Const = [0.2112];


Const = [ 0.0025];
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
70.50
62.70
78.90
68.70
63.50
70.30
62.50
39.90
];
 
F = [31.25653595
24.92075163
75.60702614
76.02941176
83.63235294
130.0947712
142.7663399
91.65767974
260.6119281
117.4232026
];



[~,~,~,t0] = loadingSilicaValues();

factor = 10;
%Starting time when particles start to elutrate from the system.
t = t0/factor;
% Type 0 = Uniform piecewise.
% Type 1 = linear piecewise
% Type 2 = Quadratic piecewise

type = 1;

for krate = 1:length(Const)

    rateconstant = Const(krate);

    for j = 1:20


           %B(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i),sd(i),t+(j-1),1,rateconstant);
           %B(j,krate) =  unetCombinedSimpsonLINEver2(0,1,t+j+2,10,rateconstant,type);
           B(j,krate) =  unetCombinedSimpsonLINEver1(0,1,t+j,10,rateconstant,type);
           
        
        disp(j)
    end

end


time = 10:10:120;



figure(1);
grid on;
hold on;
scatter(time + t0,C(1:12,1),"filled");
scatter(time + t0,B(1:12,1),"filled");
legend("Experimental data","Model");
title("Silica bag mass");
xlabel("Time Period");
ylabel("Mass")
xlim([(time(1) + t0 - 10) (time(length(time)) + t0 + 10)])
hold off;

err = immse(B(1:12),C(1:12));

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