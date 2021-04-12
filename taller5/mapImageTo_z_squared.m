function [] = mapImageToCircle(filename)
    
    %input: nombre de la imagen a transformar
    %output: matriz rgb de la imagen transformada

%% Leemos la imagen y definimos la transformación
    [X,cmap] = imread(filename);
    
    R = X(:,:,1);
    G = X(:,:,2);
    B = X(:,:,3);
    
    imshow(X);
    pause(5);
    close;
    
    [row, col] = size(R);
    
    yRange = -row/2:1:(row/2)-1;
    xRange = -col/2:1:(col/2)-1;
    
    [realgrid, imgrid] = meshgrid(xRange,yRange);
    complexGrid = realgrid + imgrid.*i;
    transfGrid = (complexGrid).*(complexGrid); % Aplicamos la transformación f(z) = z^2
 %% Graficamos la transfromación de cada componente RGB  
    real_z1 = real(transfGrid);
    imag_z1 = imag(transfGrid);
    %plot(real_z1,imag_z1,'b*')

    real_reshape = reshape(real_z1,1,[]);
    imag_reshape = reshape(imag_z1,1,[]);
    
    color_reshape_red = reshape(R,1,[]);
    color_reshape_green = reshape(G,1,[]);
    color_reshape_blue = reshape(B,1,[]);

    hold on
    
   

    figure
    scatter(real_reshape,imag_reshape,15,color_reshape_red,'filled')
    set(gca,'Color','g')
    axis off
    title('Imagen 1')
    colormap('gray')
    shading interp

    
    scatter(real_reshape,imag_reshape,15,color_reshape_green,'filled')
    set(gca,'Color','g')
    axis off
    title('Imagen 1')
    colormap('gray')
    shading interp

    
    scatter(real_reshape,imag_reshape,15,color_reshape_blue,'filled')
    set(gca,'Color','g')
    axis off
    title('Imagen 1')
    colormap('gray')
    shading interp

    hold off
end