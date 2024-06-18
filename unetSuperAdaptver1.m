
function out = unetSuperAdaptver1(s,t1,t2,k)
%time to tavel 1 metre.
c = unetDISTINVERSEver3(s,1);
%time checks and the first condition
if  t1 == t2 || t2 < t1 || s == 0 || t2 < c
    out = 0;
% evaluate normally if t1 greater than c
elseif t1 > c
    out = unetAdaptquarturever1(s,t1,t2,k);
% Singularity third case.
else
    % in case distance is less than 1.
    tau = 1;
    if (t2 - c) < 1
        tau = (t2 - c);
    end
    % inital variables.
    i = 0;
    init = Inf;
    Ans = 0;
    % use max iteration 30, cause of unstability.
    while  (i < 30)
        % iterate by adding 1/(2^n) evaluate and add to answer.
        init = unetAdaptquarturever1(s,c + tau/(2^(i+1)),c + tau/(2^i),k);
        Ans = Ans + init;
        i = i + 1;
    end
    % Total singularity and the rest
    out = Ans + unetAdaptquarturever1(s,c + tau, t2,k);
end