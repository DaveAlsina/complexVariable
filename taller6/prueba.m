%% creando el circulo y los ruidos

xCenter = 0;
yCenter = 0;
nMeasurements = 200;
theta = pi:2*pi/nMeasurements: 3*pi;
radius = 1;

x = radius * cos(theta) + xCenter;
y = radius * sin(theta) + yCenter;

b = 0;
rng(0,'twister');
noise1 = randn(length(x),1) + b;

rng(7,'twister');
noise2 = randn(length(x),1) + b;

%% creando señal de círculo ruidoso y sin ruido

x2 = x + 0.2.*noise1';
y2 = y + 0.2.*noise2';
% figure
% visualize_noisy_signal(x, x2, y, y2 ,'Señal ruidosa entorno a un círculo');
% complexNosySignal = complex(x2, y2);

%% visualización de la señal ruidosa del círculo en X y Y
% figure
% visualize_XY_noisy_signal(x, x2, y, y2, theta);

%% filtro para x2

n = length(theta);
step = 2*pi/nMeasurements;
coefs = fft(x2,n);
PSD = coefs.*conj(coefs)/n; % power spectrum density
freq = 1/(step*n)*(0:n);
L = 1:floor(n/2);
% figure
% plot(freq(L), PSD(L))

threshold = 5;
indices = PSD > threshold;
PSDclean = PSD.*indices;
coefs = indices.*coefs;
filtered_x = ifft(coefs);
% figure
% plot(freq(L), PSDclean(L))
% title('Componente en X sin ruido')

%% filtro para y2

n = length(theta);
step = 2*pi/nMeasurements;
coefs = fft(y2,n);
PSD = coefs.*conj(coefs)/n; % power spectrum density
freq = 1/(step*n)*(0:n);
L = 1:floor(n/2);
% figure
% plot(freq(L), PSD(L))

threshold = 5;
indices = PSD > threshold;
PSDclean = PSD.*indices;
coefs = indices.*coefs;
filtered_y = ifft(coefs);
% figure
% plot(freq(L), PSDclean(L))
title('Componente Y sin ruido')
% figure
% plot(theta, filtered_y)

%% circulo sin ruido
figure
plot(filtered_x, filtered_y)
grid on;
axis equal;
xlim([-1.5 1.5])
ylim([-1.5 1.5])
title('Circulo sin ruido')

%% 
plot_clean_vs_noisy_fft(theta, 2*pi/nMeasurements, 5, x2)
