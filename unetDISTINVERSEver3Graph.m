function [out,D] = unetDISTINVERSEver3Graph(size)


distance = 1:1:1000;
distance = distance/500;

for i = 1:length(distance)
    D(i) = unetDISTINVERSEver3(size,distance(i));
end


plot(distance,D);
title(['Time it takes to travel a certain distance of size ',num2str(size)]);
xlabel('Distance (m)')
ylabel('Time (mins)');


out = 1;