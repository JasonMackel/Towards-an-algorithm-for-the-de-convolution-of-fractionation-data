function C = CmatrixSilica()

%load data
[LSx, ~] = loadingSilicaLaserData();
LSx = LSx/2000;

% add in an extra point from laser data
LSx0 = 18.7;
LSx0 = LSx0/2000;

% Calculation of the Matrix linear interpolation.
for i  = 1 : length(LSx)-2
    if i == 1
        C(i,i) = 0.5*(LSx(i+1) - LSx0);
        C(i,i+1) = 0.5*(LSx(i+1) - LSx(i));
    elseif i == length(LSx)-2
        C(i,i+1) = 0.5*(LSx(i+1) - LSx(i-1));
        C(i,i) = 0.5*(LSx(i+1) - LSx(i));
    else
        C(i,i) = 0.5*(LSx(i+1) - LSx(i));
        C(i,i+1) = 0.5*(LSx(i+1) - LSx(i));
    end
end