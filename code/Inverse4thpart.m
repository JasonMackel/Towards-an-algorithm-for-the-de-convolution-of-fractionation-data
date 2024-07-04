clear all;

%Making numerical normal distributions with mu and SD with entire feed in the range

%% Part 1  p << n
%mu = [28 63 125 250 475];
%sd = [5 14 20 30 30];


%% Part 2 n << p
 n = 50;
 
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
t = 1;


Const = [0.4177];

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
70.50
62.70
78.90
68.70
63.50
70.30
62.50
39.90
];


for krate = 1:length(Const)

    rateconstant = Const(krate);

    for j = 1:20

        for i = 1:length(mu)

         %  B(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i),sd(i),t+(j-1),1,rateconstant);
           B(j,i) = unetCombinedSimpsonUniform(0,1000,mu(i),sd(i),t+(j-1),1,rateconstant);
           
        end
        disp(j)
    end

    alpha = Const(krate);

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

    SS = [-1000 19 45/2 63/2 90/2 125/2 180/2 250/2 355/2 250 2000 ];

    Sizings = zeros(n,length(SS)-1);

    for i = 1:length(SS)-1

        for j = 1:n
            Sizings(j,i) =  0.5*(1 + erf((SS(i+1)-mu(j))/(sd(j)*sqrt(2)))) - 0.5*(1 + erf((SS(i)-mu(j))/(sd(j)*sqrt(2))));

        end
    end



    i = 0;

    A2 = A1(:,krate)';
    for i = 1:length(Result)
        S1 = Sizings(:,i);
        Result(i,krate) = A2*S1;
    end


end



