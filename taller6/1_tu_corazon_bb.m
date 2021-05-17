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
% también se hace en estas lineas el filtrado agresivo de la señal
[z2_fft_clean] = plot_clean_vs_noisy_fft(theta, dt, max(abs(z2))/20, z2);
z2_reconstruct = ifft(z2_fft_clean);

%% obtención de los coeficientes de fourier filtrados 
%con un filtro menos agresivo

z_fft = fft(z2);
z_fft_clean2 = z_fft; 
z_fft_clean2(2:98) = 0;
z2_reconstruct2 = ifft(z_fft_clean2);

%% graficado de los ángulos de los coeficientes de fourier
plot_angles_fft(z, z2);

%% muestra de la señal reconstruida a partir del filtrado de los 
% coeficientes de fourier y la ifft
figure 
hold on
    plot(z2_reconstruct, '-b');
    plot(z2_reconstruct2, '--r');
    title(['Señal de corazón reconstruida']);
    legend(['Filtro +'],['Filtro -']);
hold off
%% 
visualize_XY_noisy_signal(x, real(z2_reconstruct), y, imag(z2_reconstruct), theta);


%% Análisis del nivel del ruido en la imágen
% para esto se crearán imágenes con más ruido para poder 
% comparar con el caso anterior que tenía menos ruido

rng(0,'twister');
noise1 = 2.*randn(length(x),1);

rng(7,'twister');
noise2 = 2.*randn(length(x),1);

x4 = x + noise1';
y4 = y + noise2';

z3_noisy = complex(x4, y4);

%% visualización de la señal ruidosa en X(parte real) e Y(parte imaginaria)

visualize_XY_noisy_signal(x, x4, y, y4, theta);

%% visualización de la señal ruidosa completa en el plano 
% contrastada con su versión no ruidosa

visualize_noisy_signal(z, z3_noisy, ['corazón ruidoso (ruido extra)']);

%% obtención de los coeficientes de fourier y graficado de estos
% también se hace en estas lineas el filtrado agresivo de la señal
[z3_fft_clean] = plot_clean_vs_noisy_fft(theta, dt, max(abs(z3_noisy))/20, z3_noisy);
z3_reconstruct = ifft(z3_fft_clean);

%% obtención de los coeficientes de fourier filtrados 
%con un filtro menos agresivo

z_fft_3 = fft(z3_noisy);
z_fft_clean3 = z_fft_3; 
z_fft_clean3(2:98) = 0;
z3_reconstruct2 = ifft(z_fft_clean3);

%% graficado de los ángulos de los coeficientes de fourier
plot_angles_fft(z, z3_noisy);

%% muestra de la señal reconstruida a partir del filtrado de los 
% coeficientes de fourier y la ifft
figure 
hold on
    plot(z3_reconstruct, '--.b');
    plot(z3_reconstruct2, '--r');
    title(['Señal de corazón reconstruida [Ruido Aumentado]']);
    legend(['Filtro +'],['Filtro -']);
hold off
%% 
visualize_XY_noisy_signal(x, real(z3_reconstruct), y, imag(z3_reconstruct), theta);




%% fuentes: 
% https://youtu.be/c249W6uc7ho?list=PLMrJAkhIeNNT_Xh3Oy0Y4LTj0Oxo8GqsC
% https://www.mathworks.com/help/matlab/ref/fft.html

