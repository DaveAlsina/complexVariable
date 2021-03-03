function [x, y, complex] = createHipocicloidCoordinates(scalingFactor, radious, t)
    x = (scalingFactor*radious - radious)*cos(t) + radious*cos(t*(1 - scalingFactor));
    y = (scalingFactor*radious - radious)*sin(t) + radious*sin(t*(1 - scalingFactor));
    complex = x + 1i*y;
end