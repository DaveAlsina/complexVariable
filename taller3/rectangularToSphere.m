function [x1, x2, x3] = rectangularToSphere(zre, zim)

    % input: parte real de z (zre)
    % parte imaginaria de z (zim) 
    % La función retorna la proyección estereográfica de z

    x1 = (2.*zre)/(zre.^2 + zim.^2 + 1);
    x2 = (2.*zim)/(zre.^2 + zim.^2 + 1);
    x3 = (zre.^2 + zim.^2 - 1)/(zre.^2 + zim.^2 + 1);
end