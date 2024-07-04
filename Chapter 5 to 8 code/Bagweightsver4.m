clear all;
%loading data
C = loadingSilicaBagWeights();
[~,~,~,t0] = loadingSilicaValues();

%time period for taking bagweights
factor = 10;

%Starting time of the experiment.
ts = t0/factor;
% type 0 = Uniform piecewise.
% type 1 = linear piecewise
type = 1;

%rate const, in array format, if want to try other rate constants;
Const = [0.013798012943035];

for krate = 1:length(Const)

    rateconstant = Const(krate);

    % Calculating model bag weights.
    for j = 1:20
            %First bagweight calculated from 0 to timestart
           if j == 1
               B(j,krate) = unetCombinedSimpsonLINE3ver3(0,1,0,j+ts,10,rateconstant,type);
           else 
             %Rest of the bagweights
               B(j,krate) =  unetCombinedSimpsonLINE3ver3(0,1,ts +(j-1),ts+j,10,rateconstant,type);
           end
        disp(j)
    end
end

%Putting, x axis in proper format
time = 10:10:120;

%plot figure configuration
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
ylim([-10 70])
hold off;

% error calculation.
err = immse(B(1:12),C(1:12));

