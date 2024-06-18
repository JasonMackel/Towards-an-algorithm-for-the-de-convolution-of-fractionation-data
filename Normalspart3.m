
s = -500:1:2000;
s= s/1000;

%  n = 40;
%  
%  a = 150;
%  b = 750;
%  
%  h = (b - a)/n;
%  
%  x = a:h:b; % generating mus
%  
%  for i = 1:40
%      mu2(i) = a + h*(i-1);
%      sd2(i) = 30;
%  end



% n = 50;
 
 a = 0;
 b = 0.6;
 
 h = (b - a)/n;
 
 % generating mus 
 for i = 1:n
     mu(i) = a + h*(i-1);
     sd(i) = h;
 end

f = @(x,mu,sd) (exp(-((x-mu).^2)/(2*sd.^2)) / (sd*sqrt(2*pi)));






%f(s(j),mu2(i),sd2(i))
clear Distribution;
for i = 1:n
    for j = 1:length(s)
        Distribution(j,i) = f(s(j),mu(i),sd(i));
    end
end


figure(1);
plot(s,Distribution);
grid on;
title("Inital Feed");
xlabel("size");

temp = 0;
clear Combined2;
for i = 1:length(s);
    temp = 0;
    for j = 1:n
        temp = temp + A1(j,1)*Distribution(i,j);
    end
    Combined2(i) = temp;
end

% pd2 = makedist('Uniform','lower',200,'upper',700); % Uniform distribution with a = -2 and b = 2
% pdf1 = pdf(pd2,s);

%mu = 600;
%sigma = 50;

%pd2 = makedist('normal','mu',mu,'sigma',sigma);w
%pdf1 = pdf(pd2,s);


figure(2);
plot(s,Combined2);
grid on;
hold on;
plot(s,piecewiseline(s));
title(["Output \alpha = " num2str(alpha)]);
xlabel("Particle size (mm)");
ylabel("Frequency (%/mm)");
xlim([-0.1 1]);
hold off;



F = [31.25653595
24.92075163
75.60702614
76.02941176
83.63235294
130.0947712
142.7663399
91.65767974
260.6119281
117.4232026
];


SieveSize = [0.014
0.041
0.053
0.075
0.106
0.150
0.212
0.298
0.421
0.592];


% figure(3);
% scatter(SieveSize,F,"filled");
% legend;
% grid on;
% hold on;
% scatter(SieveSize,Result(:,k),"filled");
% xlabel("Sieve Sizes");
% ylabel("Mass")
% title(["Rate Constant = " num2str(Const(k))]);
% hold off;

% m1 = 350;
% m2 = 450;
% m3 = 600;
% 
% s1 = 43;
% s2 = 63;
% s3 = 50;
% 
% 
% p1 = makedist('normal','mu',m1,'sigma',s1);
% pdfunct1 = pdf(p1,s);
% p2 = makedist('normal','mu',m2,'sigma',s2);
% pdfunct2 = pdf(p2,s);
% p3 = makedist('normal','mu',m3,'sigma',s3);
% pdfunct3 = pdf(p3,s);
% 
% sumpdfs = 1/3*(pdfunct1 + pdfunct2 + pdfunct3);
% 
% figure(3);
% plot(s,Combined2);
% grid on;
% hold on;
% plot(s,sumpdfs,'r-.','LineWidth',2);
% title(["Output alpha = " num2str(alpha)]);
% xlabel("size");
% hold off;
