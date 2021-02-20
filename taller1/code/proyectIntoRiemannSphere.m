

function [positionInSphere] = proyectIntoRiemannSphere(z)
%función encargada de convertir el numero complejo recibido (z)
%en un punto en la esfera de Riemann.

%INPUT: numero complejo
%OUTPUT: vector posición Z con x_1,x_2,x_3 como componentes

	radiusSquared = real(z).^2 + imag(z).^2;

	x_1 = (2*real(z))/(radiusSquared + 1);
	x_2 = (2*imag(z))/(radiusSquared + 1);
	x_3 = (radiusSquared - 1)/(radiusSquared + 1);

	positionInSphere = [ x_1 x_2 x_3 ];

end
