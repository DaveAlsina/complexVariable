
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

visualize_noisy_signal(x, x2, y, y2 ,'Señal ruidosa entorno a un círculo');
complexNosySignal = complex(x2, y2);

%% visualización de la señal ruidosa del círculo en X y Y

visualize_XY_noisy_signal(x, x2, y, y2, theta);

%%

coefs = fft(complexNosySignal)
P2 = abs(coefs/nMeasurements);
P1 = P2(1:(nMeasurements/2)+1);
P1(2:end-1) = 2*P1(2:end-1);

f = (0:nMeasurements/2)
plot(f, P1)

%%

coefs = fft(x + 1i*y)
P2 = abs(coefs/nMeasurements);
P1 = P2(1:(nMeasurements/2)+1);
P1(2:end-1) = 2*P1(2:end-1);

f = (0:nMeasurements/2)
plot(f, P1)



