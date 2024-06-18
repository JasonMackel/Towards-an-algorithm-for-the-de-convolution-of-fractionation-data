
s = linspace(1,900,900);
Tsuper = zeros(900,1);


for i = 1:900

    Tsuper(i) = unetDISTINVERSEver3(i,1);
end


hold on;
plot(s,Tsuper);
grid on;
title("t_e @ 1m Distance Travelled");
xlabel("size");
ylabel("t_e");
%yline([50 200],'-.b',{'t1','t2'})
%yline([350 500],'-.r',{'t1','t2'})
%yline([1000 1500],'-.m',{'t1','t2'})
hold off;