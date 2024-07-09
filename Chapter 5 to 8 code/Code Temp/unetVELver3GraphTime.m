function out = unetVELver3GraphTime(size)

time = 1:1:1000;


time = time/10;

for i = 1:length(time)
    V(i) = unetVELver3(size,time(i));
end


plot(time,V);
title(['Velocity of particle size ',num2str(size)]);
xlabel('time (mins)')
ylabel('velocity');

out = 1;