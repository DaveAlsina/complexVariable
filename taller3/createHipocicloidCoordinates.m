function [x, y, complex] = createHipocicloidCoordinates(k, r2, t)
    x = (k*r2 - r2)*cos(t) + r2*cos(t*(1 - k));
    y = (k*r2 - r2)*sin(t) + r2*sin(t*(1 - k));
    complex = x + 1i*y;
end