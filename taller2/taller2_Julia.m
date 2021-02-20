center = 0 + 0i;
radious = 2;

[z0, x, y] = createComplexGrid(1920, 1080, center, radious);


%% En esta sección se hace un show random del conjunto de julia

sz  = 6 %determina el tamaño de la malla aleatoria que 
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


display("Inicio de trayectoria circular de variación para C")
pause(2);

steps = 0:2:360;

for radiusFactor = 0.1:0.05:0.8
    for tetha = 0:5:360 
        c = radiusFactor*sin(tetha) + radiusFactor*cos(tetha).*i;
        r = abs(c)
        colors = arrayfun( @checkForJuliaSet, z0, c, 500);
        imagesc( x, y, colors);
        pause(1/120);
    end
end


%fuentes: https://www.mathworks.com/matlabcentral/answers/351622-how-to-iterate-through-matrix-with-rows-and-columns-changing-by-the-same-value

