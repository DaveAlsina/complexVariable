%% Un programa que reproduzca los resultados del ejemplo. Es decir que implemente la
%  trasnformación zT = e^z

%% Matriz de entrada
size = 256;
input_matrix = zeros(size);

    for c = 1:size 
       input_matrix(:, c) = (255/size)*c - 1;
    end

img = uint8(input_matrix); % Convertimos cada entrada de la matríz en un byte
imshow(img)


%%%%
	
%%

init_p = -pi;
end_p = pi;

xRange = init_p:((end_p-(init_p))/255): end_p;
yRange = init_p:((end_p-(init_p))/255): end_p;
%%creación de la matriz que contiene repeticiones de los valores de
[realgrid, imgrid] = meshgrid(xRange,yRange);
complexGrid = realgrid + imgrid.*i;
transfGrid = exp(complexGrid);

real_z1 = real(transfGrid);
imag_z1 = imag(transfGrid);
%plot(real_z1,imag_z1,'b*')

real_reshape = reshape(real_z1,1,[]);
imag_reshape = reshape(imag_z1,1,[]);
color_reshape = reshape(input_matrix,1,[]);

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

mapImageTo_z_squared('diomedes_1.jpg');
pause(5);
close;
mapImageToLog_z('puppy.png');