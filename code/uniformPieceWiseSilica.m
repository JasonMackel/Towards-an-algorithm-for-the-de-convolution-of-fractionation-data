function y = uniformPieceWiseSilica(x)

%Loading laser data size and values
[LSx, LSy] = loadingSilicaLaserData();

%Preparing data
LSy = LSy(2:30);
LSx = LSx/2000;

%preforming uniform interpolation.
for i = 1:length(LSy)
    LSy(i) = LSy(i)/(LSx(i+1) - LSx(i));
end

% first range
y(x <= LSx(1)) = 0;

% second range
y(LSx(1) < x & x <= LSx(2)) = LSy(1);

% third range
y(LSx(2) < x & x <= LSx(3)) = LSy(2);

% fourth range
y(LSx(3) < x & x <= LSx(4)) = LSy(3);

% second range
y(LSx(4) < x & x <= LSx(5)) = LSy(4);

% second range

y(LSx(5) < x & x <= LSx(6)) = LSy(5);

% second range
x7 = x(LSx(6) < x & x <= LSx(7));
y(LSx(6) < x & x <= LSx(7)) = LSy(6);

% second range

y(LSx(7) < x & x <= LSx(8)) = LSy(7);

% second range

y(LSx(8) < x & x <= LSx(9)) = LSy(8);

% second range

y(LSx(9) < x & x <= LSx(10)) = LSy(9);

% second range

y(LSx(10) < x & x <= LSx(11)) = LSy(10);

% second range

y(LSx(11) < x & x <= LSx(12)) = LSy(11);

% second range

y(LSx(12) < x & x <= LSx(13)) = LSy(12);

% second range

y(LSx(13) < x & x <= LSx(14)) = LSy(13);

% second range

y(LSx(14) < x & x <= LSx(15)) = LSy(14);

% second range

y(LSx(15) < x & x <= LSx(16)) =LSy(15);

% second range

y(LSx(16) < x & x <= LSx(17)) = LSy(16);

% second range

y(LSx(17) < x & x <= LSx(18)) = LSy(17);

% second range
x19 = x(LSx(18) < x & x <= LSx(19));
y(LSx(18) < x & x <= LSx(19)) =LSy(18);

% second range

y(LSx(19) < x & x <= LSx(20)) = LSy(19);

% second range

y(LSx(20) < x & x <= LSx(21)) = LSy(20);

% second range

y(LSx(21) < x & x <= LSx(22)) = LSy(21);

% second range

y(LSx(22) < x & x <= LSx(23)) =LSy(22);

% second range

y(LSx(23) < x & x <= LSx(24)) = LSy(23);
% second range

y(LSx(24) < x & x <= LSx(25)) = LSy(24);

% second range

y(LSx(25) < x & x <= LSx(26)) = LSy(25);

% second range

y(LSx(26) < x & x <= LSx(27)) = LSy(26);

% second range

y(LSx(27) < x & x <= LSx(28)) = LSy(27);
% second range

y(LSx(28) < x & x <= LSx(29)) =LSy(28);

% 29th range range

y(LSx(29) < x & x <= LSx(30)) = LSy(29);

%30th range 
y(LSx(30) < x ) = 0;

