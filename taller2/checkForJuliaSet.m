function [color] = checkForJuliaSet(z0, c, n, maxIterations)

	z = z0;				%%  guarda una copia de la variable compleja que fue creada
	color = log(1);		%%	pone un color por defecto

	for i = 1:maxIterations	%% análisis de la convergencia
		
		z = (z.^n) + c;		%% aplicación de la función de Julia

		if ( abs(z) > 2 )		%% si el módulo de z excede 2 retorne el color
			color = log(i);		%% de z, relacionado a la cantidad de iteraciones 
			break;			
		end

end 
