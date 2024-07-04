function y = linearPieceWiseChalco(x)

%Initalizing laser data size and values
[LSx, LSy] = loadingChalcoLaserData();

C = CmatrixChalco();

LSysub = LSy(2:32);

X0 = pinv(C)*LSysub;
B= null(C);

sol = @(c) X0 + B*c;

t = -dot(X0,B)/norm(X0);

LSy = sol(t);

%  LSy(2:end+1) = LSy;
%  LSy(1) = 0;


LSx = LSx/2000;

LSx0 = 18.7;

LSx0 = LSx0/2000;

% x2 = x(-4 < x & x <= -3);
% y(-4 < x & x <= -3) = -4*x2 - 13; 

y(x <= LSx0) = 0;

% first range
x1 = x(LSx0 < x & x <= LSx(1));
y(LSx0 < x & x <= LSx(1)) = lineEquation(x1,LSx0,0,LSx(1),LSy(1));


% second range
x2 = x(LSx(1) < x & x <= LSx(2));
y(LSx(1) < x & x <= LSx(2)) = lineEquation(x2,LSx(1),LSy(1),LSx(2),LSy(2));

% third range
x3 = x(LSx(2) < x & x <= LSx(3));
y(LSx(2) < x & x <= LSx(3)) = lineEquation(x3,LSx(2),LSy(2),LSx(3),LSy(3));

% fourth range
x4 = x(LSx(3) < x & x <= LSx(4));
y(LSx(3) < x & x <= LSx(4)) = lineEquation(x4,LSx(3),LSy(3),LSx(4),LSy(4));

% second range
x5 = x(LSx(4) < x & x <= LSx(5));
y(LSx(4) < x & x <= LSx(5)) = lineEquation(x5,LSx(4),LSy(4),LSx(5),LSy(5));

% second range
x6 = x(LSx(5) < x & x <= LSx(6));
y(LSx(5) < x & x <= LSx(6)) = lineEquation(x6,LSx(5),LSy(5),LSx(6),LSy(6));

% second range
x7 = x(LSx(6) < x & x <= LSx(7));
y(LSx(6) < x & x <= LSx(7)) = lineEquation(x7,LSx(6),LSy(6),LSx(7),LSy(7));

% second range
x8 = x(LSx(7) < x & x <= LSx(8));
y(LSx(7) < x & x <= LSx(8)) = lineEquation(x8,LSx(7),LSy(7),LSx(8),LSy(8));

% second range
x9 = x(LSx(8) < x & x <= LSx(9));
y(LSx(8) < x & x <= LSx(9)) = lineEquation(x9,LSx(8),LSy(8),LSx(9),LSy(9));

% second range
x10 = x(LSx(9) < x & x <= LSx(10));
y(LSx(9) < x & x <= LSx(10)) = lineEquation(x10,LSx(9),LSy(9),LSx(10),LSy(10));

% second range
x11 = x(LSx(10) < x & x <= LSx(11));
y(LSx(10) < x & x <= LSx(11)) = lineEquation(x11,LSx(10),LSy(10),LSx(11),LSy(11));

% second range
x12 = x(LSx(11) < x & x <= LSx(12));
y(LSx(11) < x & x <= LSx(12)) = lineEquation(x12,LSx(11),LSy(11),LSx(12),LSy(12));

% second range
x13 = x(LSx(12) < x & x <= LSx(13));
y(LSx(12) < x & x <= LSx(13)) = lineEquation(x13,LSx(12),LSy(12),LSx(13),LSy(13));

% second range
x14 = x(LSx(13) < x & x <= LSx(14));
y(LSx(13) < x & x <= LSx(14)) = lineEquation(x14,LSx(13),LSy(13),LSx(14),LSy(14));

% second range
x15 = x(LSx(14) < x & x <= LSx(15));
y(LSx(14) < x & x <= LSx(15)) = lineEquation(x15,LSx(14),LSy(14),LSx(15),LSy(15));

% second range
x16 = x(LSx(15) < x & x <= LSx(16));
y(LSx(15) < x & x <= LSx(16)) = lineEquation(x16,LSx(15),LSy(15),LSx(16),LSy(16));

% second range
x17 = x(LSx(16) < x & x <= LSx(17));
y(LSx(16) < x & x <= LSx(17)) = lineEquation(x17,LSx(16),LSy(16),LSx(17),LSy(17));

% second range
x18 = x(LSx(17) < x & x <= LSx(18));
y(LSx(17) < x & x <= LSx(18)) = lineEquation(x18,LSx(17),LSy(17),LSx(18),LSy(18));

% second range
x19 = x(LSx(18) < x & x <= LSx(19));
y(LSx(18) < x & x <= LSx(19)) = lineEquation(x19,LSx(18),LSy(18),LSx(19),LSy(19));

% second range
x20 = x(LSx(19) < x & x <= LSx(20));
y(LSx(19) < x & x <= LSx(20)) = lineEquation(x20,LSx(19),LSy(19),LSx(20),LSy(20));

% second range
x21 = x(LSx(20) < x & x <= LSx(21));
y(LSx(20) < x & x <= LSx(21)) = lineEquation(x21,LSx(20),LSy(20),LSx(21),LSy(21));

% second range
x22 = x(LSx(21) < x & x <= LSx(22));
y(LSx(21) < x & x <= LSx(22)) = lineEquation(x22,LSx(21),LSy(21),LSx(22),LSy(22));

% second range
x23 = x(LSx(22) < x & x <= LSx(23));
y(LSx(22) < x & x <= LSx(23)) = lineEquation(x23,LSx(22),LSy(22),LSx(23),LSy(23));

% second range
x24 = x(LSx(23) < x & x <= LSx(24));
y(LSx(23) < x & x <= LSx(24)) = lineEquation(x24,LSx(23),LSy(23),LSx(24),LSy(24));

% second range
x25 = x(LSx(24) < x & x <= LSx(25));
y(LSx(24) < x & x <= LSx(25)) = lineEquation(x25,LSx(24),LSy(24),LSx(25),LSy(25));

% second range
x26 = x(LSx(25) < x & x <= LSx(26));
y(LSx(25) < x & x <= LSx(26)) = lineEquation(x26,LSx(25),LSy(25),LSx(26),LSy(26));

% second range
x27 = x(LSx(26) < x & x <= LSx(27));
y(LSx(26) < x & x <= LSx(27)) = lineEquation(x27,LSx(26),LSy(26),LSx(27),LSy(27));

% second range
x28 = x(LSx(27) < x & x <= LSx(28));
y(LSx(27) < x & x <= LSx(28)) = lineEquation(x28,LSx(27),LSy(27),LSx(28),LSy(28));

% second range
x29 = x(LSx(28) < x & x <= LSx(29));
y(LSx(28) < x & x <= LSx(29)) = lineEquation(x29,LSx(28),LSy(28),LSx(29),LSy(29));

% second range
x30 = x(LSx(29) < x & x <= LSx(30));
y(LSx(29) < x & x <= LSx(30)) = lineEquation(x30,LSx(29),LSy(29),LSx(30),LSy(30));

% second range
% x31 = x(LSx(30) < x & x <= LSx(31));
% y(LSx(30) < x & x <= LSx(31)) = lineEquation(x31,LSx(30),LSy(30),LSx(31),LSy(31));

x31 = x(LSx(30) < x & x <= LSx(31));
y(LSx(30) < x & x <= LSx(31)) = lineEquation(x31,LSx(30),LSy(30),LSx(31),LSy(31));


x32 = x(LSx(31) < x & x <= LSx(32));
y(LSx(31) < x & x <= LSx(32)) = lineEquation(x32,LSx(31),LSy(31),LSx(32),0);

y(LSx(32) < x) = 0;