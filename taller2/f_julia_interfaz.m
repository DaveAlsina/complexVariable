function [img] = f_julia_interfaz(c,n)
% Esta función recibe como parámetros 'c' y 'n', tal que se obtiene una
% representación gráfica del conjunto de Julia de la forma g(z) = z^n + c

center = 0 + 0i;            %selección del punto para centrar la imagen
radius = 2;                %selección del radio de vista para la imagen
                            %ej: si el radio es 2 la imagen va a ir desde 
                            %(centro - radio) hasta (centro + radio) para
                            %la parte que varia en reales y también para la
                            %parte que varía en imaginarios
                            
%% Creación de la matriz con todos los números complejos que serán analizados
% Se definen qué tantos puntos se van a construir. Entre mayor sea el
% número por el cual se divide más puntos se generan. Usamos 1920 y 1080
% para una resolución de alta calidad.
xstep = ((2.*radius)/1920);
ystep = ((2.*radius)/1080);
    
% Se crean las matrices de números reales e imaginarios según la diferencia
%de valor entre cada nuevo punto que elegimos antes
xRange = gpuArray([(real(center) - radius): xstep :(real(center) + radius)]);
yRange = gpuArray([(imag(center) - radius): ystep :(imag(center) + radius)]);
    
% Se juntan las matrices para crear una única matriz con todos los números
% complejos que utilizaremos
[realgrid, imgrid] = meshgrid(xRange,yRange);    
complexGrid = realgrid + imgrid.*1i;

%% Representación gráfica
%
num_iteraciones = 500;
colors = arrayfun( @checkForJuliaSet, complexGrid, c, n, num_iteraciones);
img = imagesc( xRange, yRange, colors);
end

