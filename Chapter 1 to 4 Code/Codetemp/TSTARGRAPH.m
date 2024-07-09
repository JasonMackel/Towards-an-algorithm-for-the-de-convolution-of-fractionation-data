clear all; clc;

size = linspace(1,800,1600);


for i = 1: length(size)
   Y(i) = tSTARFAKE(size(i)); 
end

figure(1);
plot(size,Y);
title("Graph of size against tSTAR");
xlabel("Size");
ylabel("Time");

time = 400;
i = 1;
for i = 1:length(size)
    D(i) = unetDIST3FAKE(size(i), time);
    Max(i) = 1;
end


figure(2);
hold on;
plot(size,D);
plot(size,Max);
title("Graph of Distance against Time(400)");
xlabel("Size");
ylabel("Distance");




time = 600;
i = 1;
for i = 1:length(size)
    D(i) = unetDIST3FAKE(size(i), time);
end

figure(3);
hold on;
plot(size,D);
plot(size,Max);
title("Graph of Distance against Time(600)");
xlabel("Size");
ylabel("Distance");

time = 800;
i = 1;
for i = 1:length(size)
    D(i) = unetDIST3FAKE(size(i), time);
    Max(i) = 1;
end

figure(4);
hold on;
plot(size,D);
plot(size,Max);
title("Graph of Distance against Time(800)");
xlabel("Size");
ylabel("Distance");


i = 1;
time2 = linspace(1,1000,2000);
for i = 1:length(size)
  for j = 1:length(time2)
      D2(i,j) = unetDIST3FAKE(size(i),time2(j));
      Max2(i,j) = 1;
  end  
end

figure(5);
hold on;
mesh(time2,size,D2);
surf(time2,size,Max2,'FaceColor', 'black');
hold off;
title("Graph of Distance");
xlabel("Size");
ylabel("Time");
zlabel("Distance");




