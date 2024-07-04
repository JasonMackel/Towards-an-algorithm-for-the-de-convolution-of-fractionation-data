function [out1] = bisectionFunctChalcoVer2(k)

%  old style ulitizing the superadapt quarture method

% tolerance for the K'


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



[~,~,~,t0] = loadingChalcoValues;



factor = 10;
%Starting time when particles start to elutrate from the system.
ts = t0/factor;

% Type 0 = Uniform piecewise.
% Type 1 = linear piecewise
% Type 2 = Quadratic piecewise

Const = [k];


type = 1;

for krate = 1:length(Const)

    rateconstant = Const(krate);


    for j = 1:20

        if j == 1
            B(j,krate) = unetCombinedSimpsonLINEChalco3ver2(0,1,0,j+ts,factor,rateconstant,type);
            Z(j,krate) = unetCombinedSimpsonLINEChalco3ver2derive(0,1,0,j+ts,factor,rateconstant,type);
        else



            %B(j,i) = unetCombinedSimpsonNorm(0,1000,mu(i),sd(i),t+(j-1),1,rateconstant);
            B(j,krate) =  unetCombinedSimpsonLINEChalco3ver2(0,1,ts+(j-1),ts + j,factor,rateconstant,type);
            Z(j,krate) = unetCombinedSimpsonLINEChalco3ver2derive(0,1,ts+(j-1),ts + j,factor,rateconstant,type);
            %B(j,krate) =  unetCombinedSimpsonLINE3ver2(0,1,t+j,10,rateconstant,type);
        end

        disp(j)
    end

end


D = 2*(B(1:8,1) - C(1:8,1)).*(Z(1:8,1));

out1= sum(D,1);