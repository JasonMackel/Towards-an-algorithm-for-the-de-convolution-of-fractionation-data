function out = unetVELver3GraphSize(time)

size = 1:1:1000;


for i = 1:length(size)
    V(i) = unetVELver3(i,time);
end


plot(size,V);
title(['Particle velocity at time ',num2str(time),' min']);
xlabel('size');
ylabel('Velocity');

out = 1;