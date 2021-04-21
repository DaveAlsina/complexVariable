
xCenter = 0;
yCenter = 0;
theta = pi:0.01: 3*pi;
radius = 1;

x = radius * cos(theta) + xCenter;
y = radius * sin(theta) + yCenter;

b = -0.5;
rng(0,'twister');
noise1 = randn(length(x),1) + b;

rng(7,'twister');
noise2 = randn(length(x),1) + b;

complexNoise = complex(noise1, noise2);

%%
axis square;
xlim([-3 3]);
ylim([-2.5 2.5]);
grid on;
axis equal;

figure 
plot(x, y, 'k');
x2 = x + 0.3.*noise1';
y2 = y + 0.4.*noise2';
hold on;
plot(x2 ,y2, 'b');
hold off;
%%

figure
hold on;
plot(1:length(x), x);
plot(1:length(x2),x2);
hold off;

figure
hold on;
plot(1:length(y), y);
plot(1:length(y2),y2);
hold off;

