
function [complexGrid, xRange, yRange] = createComplexGrid(img_widht, img_height, center , radius)
	
	%% determinación del tamaño del paso necesitado en el arreglo
	% que da todo el rango de valores para la parte imaginaria
	% y la parte real

	xstep = ((2.*radius)/img_widht);
    ystep = ((2.*radius)/img_height);
	
    %% creación de los arreglos que indican los rangos en el plano real
	%y en el plano imaginario (acelerado con GPU)

	xRange = gpuArray([(real(center) - radius): xstep :(real(center) + radius)]);
	yRange = gpuArray([(imag(center) - radius): ystep :(imag(center) + radius)]);

	%%creación de la matriz que contiene repeticiones de los valores de
	[realgrid, imgrid] = meshgrid(xRange,yRange);
    
    complexGrid = realgrid + imgrid.*i;
end
    
