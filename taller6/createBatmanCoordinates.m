function [x,y,complex] = createBatmanCoordinates(t)
    x = (0.5*abs(t)) + (0.5*abs(t-1)) - (5/4)*abs(t-2) + (9/4)*abs(t-4) - 3*abs(t-7) + (1/2)*abs(t-13) + (0.5*abs(t-15));
    x = (abs(t)/t)*(x);
    y = abs(t-1) - 2*abs(t-2) + (4/3)*abs(t-4) - (1/3)*abs(t-7) + (1/8)*(abs(t-7) - abs(t-13) - 2).^2 + 6*cos((pi/8)*(abs(t-13)-abs(t-15)+2))-10;
    complex = x + 1i*y;
end