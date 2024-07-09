function out = unetVELver2GraphTime(size)

time = 1:1:1000;


time = time/10;

for i = 1:length(time)
    V(i) = unetVELver2(size,time(i));
end

ts = tSTARver2(size)
vs = unetVELver2(size,ts)

hold on;
plot(time,V);
plot(ts,unetVELver2(size,ts),'r*')
title(['Velocity of particle size ',num2str(size)]);
xlabel('time (mins)')
ylabel('velocity (m/s)');
hold off;

out = 1;