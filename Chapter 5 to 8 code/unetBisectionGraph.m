

x = 1:1:length(B);


figure(1);
scatter(x,B,"filled");
hold on;
grid on;
ylim([-1 0.5]);
title('Rate Constant Error');
xlabel('iteration');
ylabel('error');
hold off;




figure(2);
scatter(x,K,"filled");
hold on;
grid on;
ylim([-0.1 0.5]);
title('Rate Constant Value');
xlabel('iteration');
ylabel('value');
hold off;