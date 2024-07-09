function [out,D] = unetDISTver2Graph(size)


time = 1:1:1000;

time = time/10;

for i = 1:length(time)
    D(i) = unetDISTver2(size,time(i));
end
ts = tSTARver2(size)

hold on;
plot(time,D);
plot(ts,unetDISTver2(size,ts),'r*')
title(['Distance Travelled of particle of size ',num2str(size)]);
xlabel('Time (mins)')
ylabel('Distance (metres)');
hold off;
out = 1;