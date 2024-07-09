function [out,D] = unetDISTINVERSEver2Graph(size)


distance = 1:1:1000;
distance = distance/10;

for i = 1:length(distance)
    D(i) = unetDISTINVERSEver2(size,distance(i));
end


plot(distance,D);
title(['Time it takes to travel a certain distance of size ',num2str(size)]);
xlabel('Distance (metres)')
ylabel('Time (mins)');


out = 1;