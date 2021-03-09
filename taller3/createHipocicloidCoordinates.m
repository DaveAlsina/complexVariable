function [x, y, complex] = createHipocicloidCoordinates(k, r2, t)

    % input: r1/r2 (k) 
    % radio de la circunferencia más pequeña (r2)
    % (veanse las fórmulas
    % x = (r1 - r2)cos(t) + r2 cos(t(1 - k)
    % y = (r1 - r2)sin(t) + r2 sin(t(1 - k))

    x = (k*r2 - r2)*cos(t) + r2*cos(t*(1 - k));
    y = (k*r2 - r2)*sin(t) + r2*sin(t*(1 - k));
    complex = x + 1i*y;
end

%fuente: https://en.wikipedia.org/wiki/Hypocycloid