center = 0 + 0i;            %selección del punto para centrar la imagen
radious = 2;                %selección del radio de vista para la imagen
                            %ej: si el radio es 2 la imagen va a ir desde 
                            %(centro - radio) hasta (centro + radio) para
                            %la parte que varia en reales y también para la
                            %parte que varía en imaginarios
                            

%creación de la malla de numeros complejos que contiene "todos" los puntos
%de la caja de numeros complejos que va desde (centro -radio) hasta 
%(centro + radio) en reales, y desde (centro - radio) hasta (centro + radio)
%en imaginarios

%1920 y 1080 son las dimensiones de una imagen full HD
[z0, x, y] = createComplexGrid(1920, 1080, center, radious);


%% En esta sección se hace un show random del conjunto de julia
%a partir de la selección de parametro C de forma aleatoria

sz  = 6         %se determina el tamaño de la malla aleatoria que 
                %va a ayudar a construir los valores constantes para c

%Genera la malla de valores aleatorios para C 
realGrid = rand(sz);
imagGrid = rand(sz).*i;
C = realGrid + imagGrid;


display("Inicio de imágenes con parámetos C aleatorios")
pause(2);

for row = 1:sz
	for col = 1:sz
		
		c = C(row,col);
		colors = arrayfun( @checkForJuliaSet, z0, c, 1000);
		imagesc( x, y, colors);
		pause(1);
        
    end
    
end


%% trayectoria de círculos concéntricos para variar c

display("Inicio de trayectoria circular de variación para C")
pause(2);

% realmente esta trayectoria para variar c, se puede describir como 
% circulos concéntricos desde circulo de radio 0.1 hasta 0.8
% donde theta salta de 5 en 5 grados

for radiusFactor = 0.1:0.05:0.8         
    for theta = 0:5:360 
        
        c =  radiusFactor*cos(theta) + radiusFactor*sin(theta).*i ;
        
        % visualización del radio y ángulo para dar una idea de en qué punto se está
       
        r = abs(c);
        display([r, theta])
        
        %asignación de colores a la malla compleja centrada en 0 + 0i
        %y con radio constante de 2
        colors = arrayfun( @checkForJuliaSet, z0, c, 500);
        
        imagesc( x, y, colors); %generación de la imagen
        pause(1/120);           %pausa para el espectador
    end
end


% FUENTES:
% https://www.mathworks.com/help/parallel-computing/gpuarray.html
% https://www.mathworks.com/help/parallel-computing/illustrating-three-approaches-to-gpu-computing-the-mandelbrot-set.html;jsessionid=ce5b13303d727da26772217997f9
% https://www.mathworks.com/help/parallel-computing/run-matlab-functions-on-a-gpu.html
% https://plus.maths.org/content/computing-mandelbrot-set
% https://www.mathworks.com/matlabcentral/answers/351622-how-to-iterate-through-matrix-with-rows-and-columns-changing-by-the-same-value
