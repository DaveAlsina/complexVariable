clc
clear
close all

%% Proyección estereográfica
% z = 2 + 1i*3; 
% [a, b, c] = rectangularToSphere(real(z), imag(z));

%% Hipocicloide
k = 2.1;        %constante de agrandado del radio mayor respecto al radio menor
r2 = 1;         %tamaño del radio menor

t = 0:0.01:20*pi; %rango del parámetro para ayudar a graficar

[x,y,z] = createHipocicloidCoordinates(k, r2, t);

%% Graficamos en la esfera
graphProyecionInRiemmanSphere(z, 'Red')