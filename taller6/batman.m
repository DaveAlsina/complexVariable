%% Generación de valores en el plano de los complejos para recrear Batman:

nMeasurements = 200; %cantidad de mediciones deseadas
t = linspace(-15,15,nMeasurements); % t toma valores entre -15 y 15.
%Se calculan los valores de X y Y en en plano de los complejos en el lado
% izquierdo de la figura de Batman.
[x,y,~] = createBatmanCoordinates(t);
% Debido a la simetría de la figura, se recuperan los valores de la parte
% real para el lado derecho:
xmirror = -flip(x);
xfinal = [x, xmirror];
%Como las unidades de X son muy pequeñas, se multiplica
%Por un número grande para que así el FFT haga una buena reconstrucción.
%Para valores de casi 0, FFT no arroja resultados aceptables.
xfinal = 1000000000000000*xfinal;
% Debido a la simetría de la figura, se recuperan los valores de la parte
% imaginaria para el lado derecho:
ymirror = flip(y);
yfinal = [(y), ymirror];
%%%%%%%%%%%

%% Creación de la señal y añadido de ruido a la señal

rng(0,'twister');
noise1 = 0.01.*randn(length(xfinal),1)';

rng(0,'twister');
noise2 = 0.5.*randn(length(yfinal),1)';  

% Señal sin ruido:
z = complex(xfinal, yfinal);
% Señal con ruido:
znoisy = complex(xfinal + noise1, yfinal + noise2);


%% visualización de las componentes en x e y de la señal
% en su versión con ruido y sin ruido
visualize_XY_noisy_signal(xfinal, real(znoisy), yfinal, imag(znoisy));

%% visualización de la señal del círculo ruidoso y su señal sin ruido
visualize_noisy_signal(z, znoisy, ['Batman ruidoso']);

%% obtención de los coeficientes de fourier

% Mediante la función FFT se calculan los coeficientes de Fourier cuya
% forma matemática vimos en clase.
clean_coefs = fft(z);
noisy_coefs = fft(znoisy);

hold on
plot(abs(clean_coefs), '-b');
plot(abs(noisy_coefs), '--r');
title(['Amplitud de los Coeficientes de Fourier']);
legend('Coeficientes sin ruido', 'Coeficientes con ruido');
hold off

%% plot angles
plot_angles_fft(z, znoisy);

%% limpieza de la señal del círculo fft ruidosa

% Se impone in threshold de 20 por debajo del cual los coeficientes tienen
% un vaor igual a 0, si es por encima se dejan los coeficientes
% encontrados.
indices1 = abs(noisy_coefs) > 30;
noisy_coefs1 = noisy_coefs.*indices1;
% Mediante la función ifft se reconstruye la señal.
reconstruction1 = ifft(noisy_coefs1);

% Se impone un threshold más bajo para ver cambios en la reconstrucción de
% la señal.
indices2 = abs(noisy_coefs) > 2;
noisy_coefs2 = noisy_coefs.*indices2;
reconstruction2 = ifft(noisy_coefs2);
%% visualización de los resultados de los filtros aplicados

hold on 
title(['Resultados de los filtros aplicados'])
plot(z, 'k');
plot(reconstruction1, '--r');
plot(reconstruction2, '--.b');
legend('Batman Original', 'Batman Threshold = 30', 'Batman Threshold = 5'); %, 'Filtro +'
xlabel(['Eje Real']);
ylabel(['Eje Imaginario']);
hold off

%% Análisis de más ruido en la señal %%

indices3 = (abs(noisy_coefs - 0.1)) > 2;
noisy_coefs3 = (noisy_coefs - 0.1).*indices3;
reconstruction3 = ifft(noisy_coefs3);

hold on 
title(['Resultados de los filtros aplicados'])
plot(z, 'k');
plot(reconstruction2, '--.r');
plot(reconstruction3, '--.b');
legend('Batman Original','Batman Ruido Bajo','Batman Ruido Alto'); %, 'Filtro +'
xlabel(['Eje Real']);
ylabel(['Eje Imaginario']);
hold off
