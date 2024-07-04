clear all;
s = 1:1:30000;

s = s/10;

t1 = 0;
t2 = 1;
k =0.01;
factor = 10;


for i = 1:1

    for j = i:length(s)
        C(i,j) = unetSuperKernelver2(s(j),t1*factor,t2*factor,k);        
    end

t1 = t1 + 1;
t2 = t2 + 1;
end

x = 'Particle size $(\mu m)$';
y = '$L_i(s)$';
t = 'Graph of the Revised Kernel';


hold on;
grid on;
plot(s,C);
title(t,'Interpreter','latex');
xlabel(x,'Interpreter','latex');
ylabel(y,'Interpreter','latex');
legend('t1','t2','t3','t4','t5');
hold off;