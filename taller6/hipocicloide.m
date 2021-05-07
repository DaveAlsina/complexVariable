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

z = complex(x, y);
z2 = complex(x2, y2);

%% Visualización

figure
visualize_XY_noisy_signal(x, x2, y, y2, theta);
figure
visualize_noisy_signal(z, z2, 'Hipocicloide con ruido');

%% Coeficientes de Fourier

z2_fft_clean = plot_clean_vs_noisy_fft(theta, dt, max(abs(z2))/20, z2);
z2_reconstruct = ifft(z2_fft_clean);

%% Coeficientes de Fourier filtrados (filtro suave)

z_fft = fft(z2);
z_fft_clean2 = z_fft; 
z_fft_clean2(2:98) = 0;
z2_reconstruct2 = ifft(z_fft_clean2);

%% Ángulo de los coeficientes de Fourier

plot_angles_fft(z, z2);

%% Señal reconstruida

figure 
hold on
    plot(z2_reconstruct, '-b');
    plot(z2_reconstruct2, '--r');
    title(['Señal del hipocicloide reconstruida']);
    legend(['Filtro +'],['Filtro -']);
hold off

%% Parte real y parte imaginaria

visualize_XY_noisy_signal(x, real(z2_reconstruct), y, imag(z2_reconstruct), theta);
