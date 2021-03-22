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

%% Espirales arquimedeanas
center = 2 + 2*1i;
[x1,y1,z1] = createArchimedeanSpiralCoords(2, 0.0001, t, center);
center = 0 + 0*1i;
[x2,y2,z2] = createArchimedeanSpiralCoords(2, 0.0001, t, center);

%% grafica del hipocicloide

hold on
    graphComplexDomain(x, y, 'Grafica 0 de multiples hipocicloides', 'Blue');
    graphComplexDomain(-x, -y, 'Grafica 0 de multiples hipocicloides', 'Red');
hold off 

pause(10);
close;

hold on
    graphProyectionInRiemmanSphere(z, 'Blue', 'Grafica 0 de multiples hipocicloides')
    graphProyectionInRiemmanSphere(-z, 'Red', 'Grafica 0 de multiples hipocicloides')
hold off 

pause(10);
close;

%% grafica 1 de las espirales

%grafica del domino 1 de la grafica 1 de espirales
hold on;
    graphComplexDomain(x1, y1, 'Grafica 1 de multiples espirales de Arquimedes', 'Red');
    graphComplexDomain(-x1, -y1, 'Grafica 1 de multiples espirales de Arquimedes', 'Green');
    graphComplexDomain(x1, -y1, 'Grafica 1 de multiples espirales de Arquimedes', 'Blue');
    graphComplexDomain(-x1, y1, 'Grafica 1 de multiples espirales de Arquimedes', 'Black');
hold off;
pause(10);
close;

%proyección 1 de las espirales del dominio 1 (anterioteme mencionado)
hold on
    graphProyectionInRiemmanSphere(z1, 'Red', 'Proyección 1 de multiples espirales de Arquimedes');
    graphProyectionInRiemmanSphere(-z1, 'Green','Proyección 1 de multiples espirales de Arquimedes');
    graphProyectionInRiemmanSphere(z1.*i, 'Blue', 'Proyección 1 de multiples espirales de Arquimedes');
    graphProyectionInRiemmanSphere(-z1.*i, 'Black', 'Proyección 1 de multiples espirales de Arquimedes');
hold off
pause(10);
close;

%% grafica 2 de las espirales

%grafica del domino 2 de la grafica 2 de espirales
hold on;
    graphComplexDomain(x2, y2, 'Grafica 2 de multiples espirales de Arquimedes', 'Red');
    graphComplexDomain(-x2, -y2, 'Grafica 2 de multiples espirales de Arquimedes', 'Green');
    graphComplexDomain(x2, -y2, 'Grafica 2 de multiples espirales de Arquimedes', 'Blue');
    graphComplexDomain(-x2, y2, 'Grafica 2 de multiples espirales de Arquimedes', 'Black');
hold off;
pause(10);
close;

%proyección 1 de las espirales del dominio 2 (anterioteme mencionado)
hold on
    graphProyectionInRiemmanSphere(z2, 'Red', 'Proyección 2 de multiples espirales de Arquimedes');
    graphProyectionInRiemmanSphere(-z2, 'Green', 'Proyección 2 de multiples espirales de Arquimedes');
    graphProyectionInRiemmanSphere(z2.*i, 'Blue', 'Proyección 2 de multiples espirales de Arquimedes');
    graphProyectionInRiemmanSphere(-z2.*i, 'Black','Proyección 2 de multiples espirales de Arquimedes' );
pause(10);
hold off


% Gráfico 3 de múltiples espirógrafos!

% Cambiando el valor del parámetro b0, se crean múltiples
% espirógrafos, por lo que se hace necesario un for loop
% para proyectarlos dentro de una sola esfera.
a0 = 16;
d0 = 7;

% Gráfica del dominio!:
for b0 = 8:15
% Al modificarse b0 yo modifico t
t = 0.01:0.01:((2*pi*b0)/gcd(a0, b0));
% Utilizo la función para crear el dominio del espirógrafo.
[x,y,~] = createSpirographCoordinates(a0,b0,d0,t);
hold on
% Grafico en 2D.
graphComplexDomain(x, y,'Grafica 3 de múltiples espirógrafos','Red');
hold off
end


for b0 = 8:15
% Al modificarse b0 yo modifico t
t = 0.01:0.01:((2*pi*b0)/gcd(a0, b0));
% Utilizo la función para crear el espirógrafo.
[~,~,z] = createSpirographCoordinates(a0,b0,d0,t);
hold on
% Proyecto los resultados en una gráfica en 3D.
graphProyectionInRiemmanSphere(z,'Proyección 3 de múltiples espirógrafos','Blue')
hold off
end
