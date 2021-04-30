%% inicialización de las variables
dt = 0.01;
theta = -2.*pi:dt:2.*pi;

x = 16.*(sin(theta)).^3;
y = 13.*cos(theta) - 2.*cos(2 .* theta) - 2.*cos(3 .* theta) -cos(4.*theta);


rng(0,'twister');
noise1 = randn(length(x),1);

rng(7,'twister');
noise2 = randn(length(x),1);

x2 = x + noise1';
y2 = y + noise2';
%% visualización 

visualize_XY_noisy_signal(x, x2, y, y2, theta);
figure;
visualize_noisy_signal(x, x2, y, y2, ['corazón ruidoso']);

%% filtro para x2
x2_clean = plot_clean_vs_noisy_fft(theta, 0.001, max(x2)/10, x2);
x2_ifft = ifft(x2_clean);

%% filtro para y2
y2_clean = plot_clean_vs_noisy_fft(theta, 0.001, max(y2)/100, y2);
y2_ifft = ifft(y2_clean);

%% muestra de las reconstrucciones independientes para X e Y usando ifft

plot_XY_ifft(theta, x2_ifft, y2_ifft, 'X e Y reconstruidas con ifft y filtrado');

%% intento de reconstrucción del corazón

figure 
plot(x2_ifft, y2_ifft)

