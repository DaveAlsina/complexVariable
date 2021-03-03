clc
clear
close all

%% Proyección estereográfica
% z = 2 + 1i*3; 
% [a, b, c] = rectangularToSphere(real(z), imag(z));

%% Hipocicloide
k = 2.1;        %constante de agrandado del radio mayor respecto al radio menor
r2 = 1;         %tamaño del radio menor

t = 0:0.01:200*pi; %rango del parámetro para ayudar a graficar

[x,y,z] = createHipocicloidCoordinates(k, r2, t);

%% Espirales arquimedeanas
center = 2 + 2.*i;
[x1,y1,z1] = createArchimedeanSpiralCoords(2, 0.0001, t, center);
[x2,y2,z2] = createArchimedeanSpiralCoords(4, 0.0001, t, center);
[x3,y3,z3] = createArchimedeanSpiralCoords(8, 0.00001, t, center);


%% grafica del hipocicloide
hold on
graphProyecionInRiemmanSphere(z, 'Blue')
pause(10);
graphProyecionInRiemmanSphere(-z, 'Red')
hold off 
pause(10);
close;

%% grafica de las espirales

hold on
graphProyecionInRiemmanSphere(z1, 'Red')
graphProyecionInRiemmanSphere(-z2, 'Green')
graphProyecionInRiemmanSphere(z2.*i, 'Blue')
graphProyecionInRiemmanSphere(-z3.*i, 'Black')
hold off
pause(10);
close;

hold on
graphProyecionInRiemmanSphere(z1 - center, 'Red')
graphProyecionInRiemmanSphere(-(z2 - center), 'Green')
graphProyecionInRiemmanSphere((z2 - center).*i, 'Blue')
graphProyecionInRiemmanSphere(-(z3 - center).*i, 'Black')

pause(10);
hold off