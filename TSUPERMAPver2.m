
s = linspace(1,3000,3000);
Tsuper = zeros(900,1);


for i = 1:length(s)

    Tsuper(i) = unetDISTINVERSEver2(i,1);
end

t = '\textbf{$\ell$ = 1}';
x = 'particle size ($\mu m$)';
y = 'time (mins)';

hold on;
grid on;
plot(s,Tsuper);
title(t,'Interpreter','latex');
xlabel(x,'Interpreter','latex');
ylabel(y,'Interpreter','latex');
%yline([50 200],'-.b',{'t1','t2'})
%yline([350 500],'-.r',{'t1','t2'})
%yline([1000 1500],'-.m',{'t1','t2'})
hold off;