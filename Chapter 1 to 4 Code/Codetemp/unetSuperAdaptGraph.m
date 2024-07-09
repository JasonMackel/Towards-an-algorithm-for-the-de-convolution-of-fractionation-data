clear all;

k = 0.01;

s = 1:1:4000;
for i = 1:20
    for j = 1:length(s)
       K(j,i) = unetSuperAdapt(s(j),(i-1)*10,i*10,k);
    end
end

x = 'particle size ($\mu m$)';
y = '$L_i(s) [10(i-1), 10i]$';
t = 'Graph of $L_i(s)$';

hold on;
grid on;
plot(s,K);
xlabel(x,'Interpreter','latex');
ylabel(y,'Interpreter','latex');
title(t,'Interpreter','latex');
legend('t = 0-10 minutes','t = 10 - 20 minutes', 't = 20 - 30 minutes');