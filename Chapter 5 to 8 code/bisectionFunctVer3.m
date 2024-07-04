function [out1] = bisectionFunctVer3(k)

%loading values
C = loadingSilicaBagWeights();
[~,~,~,t0] = loadingSilicaValues();

%Time period for collection
factor = 10;

%Starting time when experiments starts (time start)
ts = t0/factor;

% Type 0 = Uniform piecewise.
% Type 1 = linear piecewise
type = 1;

%loop to calculate the bagweights with the estimated rate constant
for j = 1:12
    % represents the first bag weight
    if j == 1
        B(j,1) = unetCombinedSimpsonLINE3ver3(0,1,0,j+ts,factor,k,type);
        Z(j,1) = unetCombinedSimpsonLINE3ver3derive(0,1,0,j+ts,factor,k,type);
    else
    % represents the rest.
        B(j,1) =  unetCombinedSimpsonLINE3ver3(0,1,ts+(j-1),ts + j,factor,k,type);
        Z(j,1) = unetCombinedSimpsonLINE3ver3derive(0,1,ts+(j-1),ts + j,factor,k,type);
    end

    disp(j)
end
%Calculate f'(k)
D = 2*(B(1:12,1) - C(1:12,1)).*(Z(1:12,1));

out1= sum(D,1);