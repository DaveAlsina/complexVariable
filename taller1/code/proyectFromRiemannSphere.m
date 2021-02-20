

function [complexNumber] = proyectFromRiemannSphere(Z)
%función encargada de convertir el vector posición en la
%esfera de Riemann a un numero complejo

%INPUT: vector posición Z con x_1,x_2,x_3 como componentes
%OUTPUT: numero complejo 

	x = Z(1)/(1 - Z(3));
	y = Z(2)/(1 - Z(3));

	complexNumber = x + y.*i;

end
