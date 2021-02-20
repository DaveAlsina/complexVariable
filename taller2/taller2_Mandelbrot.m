center = 0 + 0i;            %selección del centro de la imagen
centerMovementStep = 0.1;   %parámetro que indica que tanto debe ir moviéndose 
							%el centro en la animación

radious = 2;				%radio inicial 
minimalRadious = 0.0001;	%radio final
radiousStep = 0.1;			%paso de variación del radio


% con la variable center se hace selección del punto para centrar la imagen
% con la variable radio se hace selección del radio de vista para la imagen
%ej: si el radio es 2 la imagen va a ir desde 
%(centro - radio) hasta (centro + radio) para
%la parte que varia en reales y también para la
%parte que varía en imaginarios


while (center < 1/4) || (radious > minimalRadious)
    
	%1920 y 1080 son las dimensiones de una imagen full HD
    [z0, x, y] = createComplexGrid(1920, 1080, center, radious);

	%asignasión de colores acelerada por gpu, para cada uno de los 
	%puntos contenidos en la malla de complejos
    colors = arrayfun( @checkForMandelbrotSet, z0, 5000);

	%generación de la imagen
    imagesc( x, y, colors);

    pause(0.000001); %pausa para el espectador
    

	%el principio para producir la animación es ir moviendo el centro solo en 
	%reales, hasta llegar aprox. a 1/4 en reales (punto arbitrario de interés)

    if (center <= 1/4)
       center = center + centerMovementStep
    end

	%adicionalmente en la animación se busca ir haciendo un zoom mientras se 
	%mueve el centro o inclusive si deja de moverse, en caso de que se haya 
	%llegado antes al punto central de observación de interés
    
    if (radious > minimalRadious)
       radious = radious - radiousStep
    end
    
end

% FUENTES:
% https://www.mathworks.com/help/parallel-computing/gpuarray.html
% https://www.mathworks.com/help/parallel-computing/illustrating-three-approaches-to-gpu-computing-the-mandelbrot-set.html;jsessionid=ce5b13303d727da26772217997f9
% https://www.mathworks.com/help/parallel-computing/run-matlab-functions-on-a-gpu.html
% https://plus.maths.org/content/computing-mandelbrot-set
% https://www.mathworks.com/matlabcentral/answers/351622-how-to-iterate-through-matrix-with-rows-and-columns-changing-by-the-same-value



