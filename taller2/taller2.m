center = 0 + 0i;
centerMovementStep = 0.1;

radious = 2;
minimalRadious = 0.0001;
radiousStep = 0.1;

while (center < 1/4) || (radious > minimalRadious)
    
    [z0, x, y] = createComplexGrid(1920, 1080, center, radious);
    colors = arrayfun( @checkForMandelbrotSet, z0, 5000);
    imagesc( x, y, colors);
    pause(0.000001);
    
    if (center <= 1/4)
       center = center + centerMovementStep
    end
    
    if (radious > minimalRadious)
       radious = radious - radiousStep
    end
    
end