%% Generaci�n de valores en el plano de los complejos para recrear Batman:

nMeasurements = 200; %cantidad de mediciones deseadas
t = linspace(-15,15,nMeasurements); % t toma valores entre -15 y 15.
%Se calculan los valores de X y Y en en plano de los complejos en el lado
% izquierdo de la figura de Batman.
[x,y,~] = createBatmanCoordinates(t);
% Debido a la simetr�a de la figura, se recuperan los valores de la parte
% real para el lado derecho:
xmirror = -flip(x);
xfinal = [x, xmirror];
%Como las unidades de X son muy peque�as, se multiplica
%Por un n�mero grande para que as� el FFT haga una buena reconstrucci�n.
%Para valores de casi 0, FFT no arroja resultados aceptables.
xfinal = 1000000000000000*xfinal;
% Debido a la simetr�a de la figura, se recuperan los valores de la parte
% imaginaria para el lado derecho:
ymirror = flip(y);
yfinal = [(y), ymirror];
%%%%%%%%%%%

%% Creaci�n de la se�al y a�adido de ruido a la se�al

rng(0,'twister');
noise1 = 0.01.*randn(length(xfinal),1)';

rng(0,'twister');
noise2 = 0.5.*randn(length(yfinal),1)';  

% Se�al sin ruido:
z = complex(xfinal, yfinal);
% Se�al con ruido:
znoisy = complex(xfinal + noise1, yfinal + noise2);


%% visualizaci�n de las componentes en x e y de la se�al
% en su versi�n con ruido y sin ruido
visualize_XY_noisy_signal(xfinal, real(znoisy), yfinal, imag(znoisy));

%% visualizaci�n de la se�al del c�rculo ruidoso y su se�al sin ruido
visualize_noisy_signal(z, znoisy, ['Batman ruidoso']);

%% obtenci�n de los coeficientes de fourier

% Mediante la funci�n FFT se calculan los coeficientes de Fourier cuya
% forma matem�tica vimos en clase.
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

%% limpieza de la se�al del c�rculo fft ruidosa

% Se impone in threshold de 20 por debajo del cual los coeficientes tienen
% un vaor igual a 0, si es por encima se dejan los coeficientes
% encontrados.
indices1 = abs(noisy_coefs) > 30;
noisy_coefs1 = noisy_coefs.*indices1;
% Mediante la funci�n ifft se reconstruye la se�al.
reconstruction1 = ifft(noisy_coefs1);

% Se impone un threshold m�s bajo para ver cambios en la reconstrucci�n de
% la se�al.
indices2 = abs(noisy_coefs) > 2;
noisy_coefs2 = noisy_coefs.*indices2;
reconstruction2 = ifft(noisy_coefs2);
%% visualizaci�n de los resultados de los filtros aplicados

hold on 
title(['Resultados de los filtros aplicados'])
plot(z, 'k');
plot(reconstruction1, '--r');
plot(reconstruction2, '--.b');
legend('Batman Original', 'Batman Threshold = 30', 'Batman Threshold = 5'); %, 'Filtro +'
xlabel(['Eje Real']);
ylabel(['Eje Imaginario']);
hold off

%% An�lisis de m�s ruido en la se�al %%

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
