clear all;

%Making numerical normal distributions with mu and SD with entire feed in the range

%% Part 1  p << n
%mu = [28 63 125 250 475];
%sd = [5 14 20 30 30];


%% Part 2 n << p
 n = 50;
 
 a = 0;
 b = 0.48;
 
 h = (b - a)/n;
 
 % generating mus 
 for i = 1:n
     mu(i) = a + h*(i-1);
     sd(i) = h;
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



Const = [0.2112];
Const = [0.0138];

 Result  = zeros(10,length(Const));
 A1  = zeros(n,length(Const));

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


for krate = 1:length(Const)

    rateconstant = Const(krate);

    for j = 1:12

        for i = 1:length(mu)

           if j == 1
            B(j,i) = unetCombinedSimpsonUnknown(0,2,mu(i),sd(i),1,rateconstant,10) + unetCombinedSimpsonUnknown(0,2,mu(i),sd(i),2,rateconstant,10) + unetCombinedSimpsonUnknown(0,2,mu(i),sd(i),3,rateconstant,10);

           else 

           B(j,i) = unetCombinedSimpsonUnknown(0,2,mu(i),sd(i),2+j,rateconstant,10);
           end 
        end
        disp(j)
        disp(2+j)
    end

    alpha = 1;

    BTB = B'*B + alpha*eye(n);
    invBTB = inv(BTB);

    for i = 1:n
        d(i,1) = 1;
    end

    BTC = B'*C;

    A1(:,krate) =  invBTB*(BTC-((dot(invBTB*BTC,d) - 1034)/dot(invBTB*d,d)*d));


end
