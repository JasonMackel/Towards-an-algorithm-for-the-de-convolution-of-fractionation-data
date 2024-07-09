function [out,D] = unetDISTver3Graph(size)


time = 1:1:1000;

time = time/10;

for i = 1:length(time)
    D(i) = unetDISTver3(size,time(i));
end



plot(time,D);

title(['Distance Travelled of particle of size',num2str(size)]);
xlabel('Time')
ylabel('Distance');

out = 1;