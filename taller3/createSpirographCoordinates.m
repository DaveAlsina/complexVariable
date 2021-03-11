function [complex] = createSpirographCoordinates(a0,b0,d0,t)
    x = (a0-b0)*cos(t) + d0*cos(((a0-b0)/b0)*t);
    y = (a0-b0)*sin(t) - d0*sin(((a0-b0)/b0)*t);
    complex = x + 1i*y;
end