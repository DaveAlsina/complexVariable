%% generación de la variable en x de la señal
nMeasurements = 200; %cantidad de mediciones deseadas

%note que según la gráfica del ejercicio x va desde -1 hasta 1 
%y después regresa a su lugar en -1
%linspace ayuda a hacer exactamente eso
x = linspace(-1,1,nMeasurements);
xmirror = linspace(1,-1,nMeasurements);

xfinal = [x, xmirror]; %generación de X completo y normalizado 

%% generación del círculo a partir de estos trozos de x y xmirror

%a partir de la fórmula de un círculo x.^2 + y.^2 = 1, y despejando se
%obtiene que se puede generar un círculo así:

radio = 1;         

y = sqrt(radio - x.^2);
ymirror = -sqrt(radio - xmirror.^2);

yfinal = [y, ymirror];

%% creación de la señal y añadido de ruido a la señal

rng(0,'twister');
noise1 = 0.1.*randn(length(xfinal),1)';

rng(7,'twister');
noise2 = 0.2.*randn(length(yfinal),1)';  

z = complex(xfinal, yfinal);
znoisy = complex(xfinal + noise1, yfinal + noise2);

%% visualización de las componentes en x e y de la señal
% en su versión con ruido y sin ruido
visualize_XY_noisy_signal(xfinal, real(znoisy), yfinal, imag(znoisy));

%% visualización de la señal del círculo ruidoso y su señal sin ruido
visualize_noisy_signal(z, znoisy, ["círculo ruidoso"]);

%% obtención de los coeficientes de fourier

clean_coefs = fft(z);
noisy_coefs = fft(znoisy);

hold on
plot(abs(clean_coefs), '-b');
plot(abs(noisy_coefs), '--r');
title(["Amplitud de los Coeficientes de Fourier"]);
legend(["Coeficientes sin ruido", "Coeficientes con ruido"]);
hold off

%% plot angles
plot_angles_fft(z, znoisy);

%% limpieza de la señal del círculo fft ruidosa
%se limpia entre las frecuencias que se indica en el ejercicio:

noisy_coefs(20:181) = 0; 

% se limpia aún más en una región seleccionada 
% procurando guardar la simetría
extra_filtered_fft = noisy_coefs;
extra_filtered_fft(20:380) = 0;     %filtrado agresivo

%% visualización de los resultados de los filtros aplicados

hold on 
title(["Resultados de los filtros aplicados"])
plot(z, 'k');
plot(ifft(noisy_coefs), '--r');
plot(ifft(extra_filtered_fft), '--.b');
legend(["Círculo Original", "Filtro -", "Filtro +"]);
xlabel(["Eje Real"]);
ylabel(["Eje Imaginario"]);
hold off
