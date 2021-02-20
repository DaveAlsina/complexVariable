function [res] = solveComplexCuadratic(z1, z2, z3) %entradas complejas zi, i={1,2,3}
    
    realroot1 = (-real(z2) + sqrt(real(z2).^2 -4 * real(z2) * real(z3) ))/(2*real(z1));
    realroot2 = (-real(z2) - sqrt(real(z2).^2 -4 * real(z2) * real(z3) ))/(2*real(z1));
    
	imagroot1 = (-imag(z2) + sqrt(imag(z2).^2 -4 * imag(z2) * imag(z3) ))/(2*imag(z1));
	imagroot2 = (-imag(z2) - sqrt(imag(z2).^2 -4 * imag(z2) * imag(z3) ))/(2*imag(z1));

    
    [r1, dir1] = converToRad(realroot1 + imagroot1.*i);
    [r2, dir2] = converToRad(realroot1 + imagroot2.*i);
    [r3, dir3] = converToRad(realroot2 + imagroot1.*i);
    [r4, dir4] = converToRad(realroot2 + imagroot2.*i);
    
    res = [r1 dir1; r2 dir2;r3 dir3;r4 dir4];

end

