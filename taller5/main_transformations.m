%% Un programa que reproduzca los resultados del ejemplo. Es decir que implemente la
%  trasnformación zT = e^z

%% Matriz de entrada

% Se define una matriz de ceros de orden igual a 256.
size = 256;
input_matrix = zeros(size);

% Se construye una matriz que guarde la intensidad de los colores en esta matriz. %
% Cada columna de esta matriz tendrá valores iguales desde uno hasta 256 en
% este caso.
    for c = 1:size 
       input_matrix(:, c) = (255/size)*c - 1;
    end

img = uint8(input_matrix); % Convertimos cada entrada de la matríz en un byte
imshow(img) % Se muestra la imagen.


%%%%
	
%% Matriz Transformada

% Se definen los límites de los ejes X y Y en el plano de los complejos.
% Por trial and error, se encontró que éstos valores arrojan un output
% interesante.
init_p = -pi;
end_p = pi;

% Se definen valores para X y Y de acuerdo con un
% intervalo.
xRange = init_p:((end_p-(init_p))/255): end_p;
yRange = init_p:((end_p-(init_p))/255): end_p;
% Con los vectores de los valores posibles para X y Y se crea un meshgrid.
[realgrid, imgrid] = meshgrid(xRange,yRange);
complexGrid = realgrid + imgrid.*i;
% Se calcula la transformación Exp(Z).
transfGrid = exp(complexGrid);

% Deduce una matriz de la parte real de ésta matriz.
real_z1 = real(transfGrid);
% De deduce una matriz de la parte imaginaria de cada uno de los valores de
% ésta matriz.
imag_z1 = imag(transfGrid);
%plot(real_z1,imag_z1,'b*')

% Dado que yo tengo matrices de la parte real e imaginaria de los nuevos
% valores dada la transformación, y además tengo una matriz de los colores
% asignados, mediante reshape yo las convierto a vectores.
real_reshape = reshape(real_z1,1,[]);
imag_reshape = reshape(imag_z1,1,[]);
color_reshape = reshape(input_matrix,1,[]);

% Mediante la función scatter, se grafican los puntos.
% Se utiliza escala de grises mediante colormap y se ponen sombras de
% acuerdo con una interpolación.
figure
scatter(real_reshape,imag_reshape,1000,color_reshape,'filled')
set(gca,'Color','g')
axis off
title('Imagen 1')
colormap('gray')
shading interp

%%
% Punto 2.2 y 2.3 (Una transformaci´on de otro tipo que usted quiera implementar.)
% (Ambas transformaciones aplicadas a una imagen que usted genere, o a alguna imagen
% que quiera analizar.)

% Se transforma una imagen de Diomedes Díaz.
mapImageTo_z_squared('diomedes_1.jpg');
pause(5);
close;
% Se transforma la imagen de un perrito.
mapImageToLog_z('puppy.png');
