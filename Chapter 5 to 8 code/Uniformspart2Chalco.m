
s = -5:0.1:2000;
s= s/1000;


n = 29;
for i = 1:n
    Z = makedist('Uniform','lower',Uniform(1,i),'upper',Uniform(2,i));
    pdfuni = pdf(Z,s);
    for j = 1:20051
        Distribution(j,i) = pdfuni(j);
    end
end



figure(1);
plot(s,Distribution);
grid on;
title("Inital Feed");
xlabel("size");

 temp = 0;
 for i = 1:20051
      temp = 0;
     for j = 1:n
          temp = temp + A1(j)*Distribution(i,j);
      end
      Combined2(i) = temp;
 end
% 
% pd2 = makedist('Uniform','lower',200,'upper',700); % Uniform distribution with a = -2 and b = 2
% pdf1 = pdf(pd2,s);
% 
% mu = 600;
% sigma = 50;
% 
% %pd2 = makedist('normal','mu',mu,'sigma',sigma);
% %pdf1 = pdf(pd2,s);
% y3 = gampdf(s,15,30);
% 
% 

Combined2(Combined2 < 0) = 0;
 figure(2);
 plot(s,Combined2);
 grid on;
 hold on;
 plot(s,uniformPieceWiseChalco(s));
% plot(s,pdf1,'r-.','LineWidth',2);
% %plot(s,y3,'b-.');
 title(["Output \alpha = " num2str(alpha)]);
 xlabel("size");
 ylabel("Frequency (%/mm)");
 xlim([-0.1 1]);
 hold off;



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
