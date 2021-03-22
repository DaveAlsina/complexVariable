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
close;

%% Gráfico 3 de múltiples espirógrafos!

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
pause(10);
close;

for b0 = 8:15
% Al modificarse b0 yo modifico t
t = 0.01:0.01:((2*pi*b0)/gcd(a0, b0));
% Utilizo la función para crear el espirógrafo.
[~,~,z] = createSpirographCoordinates(a0,b0,d0,t);
hold on
% Proyecto los resultados en una gráfica en 3D.
graphProyectionInRiemmanSphere(z,'Blue','Proyección 3 de múltiples espirógrafos')
hold off
end
pause(10);
close;

%% Gráfica 4. Rosas polares
% Se crean 3 rosas polares de distinto radio (0.12, 0.7, 4) centradas en el origen 
[x,y,complex] = createPolarFiguresCoordinates('sin',5,0.12);
[x1,y1,complex1] = createPolarFiguresCoordinates('sin',5,0.7);
[x2,y2,complex2] = createPolarFiguresCoordinates('sin',5,4);

% Creación de la gráfica en el plano complejo
hold on

ax = subplot(1,1,1);
title('Gráfica 4. Rosas polares')
xlabel('Eje real')
ylabel('Eje imaginario')

% Se crean rosas de un determinado tamaño en distintas distancias con
% respecto al centro. Se comienzan graficando las rosas más pequeñas 
% centradas en puntos cerca del origen. Y luego se grafican las rosas más 
% grandes ceentradas en puntos cada vez más alejados del origen
for theta = 0:50:300
    for r = linspace(0.2,1,4)
        x = cosd(theta).*r;
        y = -sind(theta).*1i.*r;
        ncomplex = complex+x+y;
        plot(ncomplex,'k')       
    end
end 

for theta = 0:50:300
    for r = linspace(1.5,5,4)
        x = cosd(theta).*r;
        y = -sind(theta).*1i.*r;
        ncomplex = complex1+x+y;
        plot(ncomplex,'r')       
    end
end 

for theta = 0:50:300
    for r = linspace(8,15,2)
        x = cosd(theta).*r;
        y = -sind(theta).*1i.*r;
        ncomplex = complex2+x+y;
        plot(ncomplex,'g')        
    end
end 

 grid on
 axis equal 

hold off
pause(10);
close;

hold on
%Para hacerlo se utiliza la misma lógica anterior
for theta = 0:50:300
    for r = linspace(0.2,1,4)
        x = cosd(theta).*r;
        y = -sind(theta).*1i.*r;
        ncomplex = complex+x+y;
        graphProyectionInRiemmanSphere(ncomplex,'black','Proyección 4. Rosas polares')
    end
end 

for theta = 0:50:300
    for r = linspace(1.5,5,4)
        x = cosd(theta).*r;
        y = -sind(theta).*1i.*r;
        ncomplex = complex1+x+y;
        graphProyectionInRiemmanSphere(ncomplex,'red','Proyección 4. Rosas polares')
    end
end 

for theta = 0:50:300
    for r = linspace(8,15,2)
        x = cosd(theta).*r;
        y = -sind(theta).*1i.*r;
        ncomplex = complex2+x+y;
        graphProyectionInRiemmanSphere(ncomplex,'green','Proyección 4. Rosas polares')
    end
end 

hold off
