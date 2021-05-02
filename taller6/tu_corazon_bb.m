%% inicialización de las variables
dt = 0.01;                  %seteo del delta de t para el parámetro que va a ayudar 
                            %a generar la señal 
theta = -2.*pi:dt:2.*pi;    %creación del parámetro para construcción de la señal

%inicialización de las funciones de theta en X e Y que van a acabar
%formando la señal
x = 16.*(sin(theta)).^3;
y = 13.*cos(theta) - 2.*cos(2 .* theta) - 2.*cos(3 .* theta) -cos(4.*theta);

%inicialización de los ruidos para X e Y con semillas de generación 
%de números aleatorios distinta
rng(0,'twister');
noise1 = 0.5.*randn(length(x),1);

rng(7,'twister');
noise2 = 0.5.*randn(length(x),1);

x2 = x + noise1';
y2 = y + noise2';

z = complex(x, y);
z2 = complex(x2, y2);
%% visualización de la señal ruidosa en X(parte real) e Y(parte imaginaria)

visualize_XY_noisy_signal(x, x2, y, y2, theta);

%% visualización de la señal ruidosa completa en el plano 
% contrastada con su versión no ruidosa

visualize_noisy_signal(z, z2, ['corazón ruidoso']);

%% obtención de los coeficientes de fourier y graficado de estos
[z2_fft_clean] = plot_clean_vs_noisy_fft(theta, dt, max(abs(z2))/20, z2);
z2_reconstruct = ifft(z2_fft_clean);

%% graficado de los ángulos de los coeficientes de fourier
plot_angles_fft(z, z2);

%% muestra de la señal reconstruida a partir del filtrado de los 
% coeficientes de fourier y la ifft
figure 
plot(z2_reconstruct);
title(["Señal de corazón reconstruida"]);



% fuentes: 
% https://youtu.be/c249W6uc7ho?list=PLMrJAkhIeNNT_Xh3Oy0Y4LTj0Oxo8GqsC
% https://www.mathworks.com/help/matlab/ref/fft.html

