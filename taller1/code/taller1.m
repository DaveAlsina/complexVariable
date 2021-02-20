%---------------------------------------------------------------------
%   Testeo de solución de sistema de ecuaciones complejo
%   ejercicio   (3)
%---------------------------------------------------------------------

eqn = [1+i 2+i 3+i];         %parámetros de la ecuación organizados en un vector así:
                            %[a b c]
                            
res = solveComplexCuadratic(eqn(1), eqn(2), eqn(3)) %solución del sistema de ecuaciones



%---------------------------------------------------------------------
%   Testeo de proyección de numero complejo z en la esfera de Riemann
%   ejercicio   (4)
%---------------------------------------------------------------------

%creación de los números de testeo
z1 = 1+1i;
z2 = 1i;
z3 = 1;
z4 = 0;

zplane(z1)

%conversión de puntos en el plano a puntos en la esfera
complexNumInSphere1 = proyectIntoRiemannSphere(z1);
complexNumInSphere2 = proyectIntoRiemannSphere(z2);
complexNumInSphere3 = proyectIntoRiemannSphere(z3);
complexNumInSphere4 = proyectIntoRiemannSphere(z4);

%matriz para visualizar los puntos más cómodamente
dotsInSphere = [complexNumInSphere1; complexNumInSphere2; 
                 complexNumInSphere3; complexNumInSphere4]
 
%prueba de funcionamiento de función inversa
cNum1 = proyectFromRiemannSphere(dotsInSphere(1,:));
cNum2 = proyectFromRiemannSphere(dotsInSphere(2,:));
cNum3 = proyectFromRiemannSphere(dotsInSphere(3,:));
cNum4 = proyectFromRiemannSphere(dotsInSphere(4,:));
            
zplane(z1)    
