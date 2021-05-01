clc
clear
close all

%% Inicialización de las variables

% Parametros
dt = 0.01;
theta = 0:dt:20*pi;
k = 2.1;
r2 = 1;

% Hipocicloide
x = (k*r2 - r2)*cos(theta) + r2*cos(theta*(1 - k));
y = (k*r2 - r2)*sin(theta) + r2*sin(theta*(1 - k));

% Ruidos
rng(0,'twister');
noise1 = 0.2.*randn(length(x),1);

rng(7,'twister');
noise2 = 0.2.*randn(length(x),1);

% Hipocicloide con ruido
x2 = x + noise1';
y2 = y + noise2';

%% Visualización

figure
visualize_XY_noisy_signal(x, x2, y, y2, theta);
figure
visualize_noisy_signal(x, x2, y, y2, ['Hipocicloide con ruido']);

%% Filtro para x2

x2_fft = plot_clean_vs_noisy_fft(theta, 0.01, 1, x2);
x2_clean = ifft(x2_fft);

figure 
plot(theta, x2_clean);

%% Filtro para y2

y2_fft = plot_clean_vs_noisy_fft(theta, 0.01, 1, y2);
y2_clean = ifft(y2_fft);

figure 
plot(theta, y2_clean);

%% Muestra de las reconstrucciones independientes para X e Y usando ifft

plot_XY_ifft(theta, x2_clean, y2_clean, 'X e Y reconstruidas con ifft y filtrado');

%% Reconstrucción del hipocicloide

figure 
plot(x2_clean, y2_clean)





