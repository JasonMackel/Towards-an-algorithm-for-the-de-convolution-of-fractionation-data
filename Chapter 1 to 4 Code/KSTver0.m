function out = KSTver0(s,t,k)

  tSTAR = tSTARver2(s); % finding tstar
 DIST = unetDISTver2(s,t); % distance function

DISTTruth = DIST>1;% if distance traveled greater than 1

%EXPCHECK2 = exp(-k.*(sqrt(  (t-tSTARFAKE(s)).^2 - (2/(lambda.*U)) )));

 if DISTTruth == 0
    out = 0; % returns 0 if less than 1 traveled
 else
    Cplus = unetVELver2(s,t); 
    Cst = unetVELver2(s,unetDISTINVERSEver2(s,DIST - 1)); % find velocit
    EXPCHECK = exp(-k.*(unetDISTINVERSEver2(s,DIST-1) - tSTAR));
    out = k.*(Cplus./Cst).*EXPCHECK.*DISTTruth; % formula to calculate  
 end