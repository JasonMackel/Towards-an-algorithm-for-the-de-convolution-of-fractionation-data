

a = 0;
b = 1;

n = 16000;

h =(b-a)/n;


x =  a:h:b;

for ix = 1 : length(x)
    y(ix) = linearPieceWiseChalco(x(ix));
    z(ix) = uniformPieceWiseChalco(x(ix));
end


% [PSx,PSy] = initialiseSieveData();
% [LSx,LSy] = initialiseLaserData();
% 
% PSx = PSx/2000;
% 
figure(6)
hold on;
grid on;
xlabel("size interval (microns)");
ylabel("frequency");
 plot(x, y);
  plot(x,z);
% scatter(PSx,PSy)
legend('linear','uniform');
hold off;