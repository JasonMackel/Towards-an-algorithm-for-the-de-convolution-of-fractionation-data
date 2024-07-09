function out = KSTver1(s,t,k)

% Finding tstar
tSTAR = tSTARver3(s); 
% Distance function
DIST = unetDISTver3(s,t); 
% Characteristic function
CharDist = DIST>1;

if CharDist == 0
    % Returns 0 if less than 1 traveled
    out = 0; 
else
    %calculating KST
    Cplus = unetVELver3(s,t);
    Cst = unetVELver3(s,unetDISTINVERSEver3(s,DIST - 1)); 
    EXP = exp(-k.*(unetDISTINVERSEver3(s,DIST-1) - tSTAR));
    out = k.*(Cplus./Cst).*EXP.*CharDist; 
end