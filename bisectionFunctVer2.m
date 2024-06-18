function [out1] = bisectionFunctVer2(k)

%  old style ulitizing the superadapt quarture method

% tolerance for the K'


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



%Starting time when particles start to elutrate from the system.
t = 0;
% Type 0 = Uniform piecewise.
% Type 1 = linear piecewise
% Type 2 = Quadratic piecewise

Const = [k];


type = 1;

for krate = 1:length(Const)

    rateconstant = Const(krate);

    for j = 1:12


           %B(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i),sd(i),t+(j-1),1,rateconstant);
           %B(j,krate) =  unetCombinedSimpsonLINEver2(0,1,t+j,10,rateconstant,type);
           B(j,krate) =  unetCombinedSimpsonLINE3(0,1,t+j,10,rateconstant,type);
           Z(j,krate) = unetCombinedSimpsonLINE3derive(0,1,t+j,10,rateconstant,type);
        
        disp(j)
    end

end


D = 2*(B(1:12,1) - C(1:12,1)).*(Z(1:12,1));

out1= sum(D,1);