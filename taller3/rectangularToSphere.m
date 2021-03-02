    % Función que convierte coordenadas en el plano complejo en coordenadas en 
% la esfera de Riemman, recibe como argumento la parte real y imaginaria
% de un número complejo

function [x1, x2, x3] = rectangularToSphere(zre, zim)
    x1 = (2*    zre)/(zre^2 + zim^2 + 1);
    x2 = (2*zim)/(zre^2 + zim^2 + 1);
    x3 = (zre^2 + zim^2 - 1)/(zre^2 + zim^2 + 1);
end