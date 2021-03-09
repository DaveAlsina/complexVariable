function [x, y, z] = createArchimedeanSpiralCoords(thetaFactor, spacingFactor, theta, zCenter)

    % input: factor de multiplicación para theta (a)
    % (véase la fórmula r = b + a*(theta) )
    % factor de espaciado (b) que va variando en las distintas
    % espirales generadas

    position = 1;
    x = zeros(1, length(theta));
    y = zeros(1, length(theta));
    z = zeros(1, length(theta));
    
   
    for angle = theta
      r = (spacingFactor) + thetaFactor.*angle;
      y(position) = (r .* sin(thetaFactor .* angle)) + real(zCenter);
      x(position) = (r .* cos(thetaFactor .* angle)) + imag(zCenter); 
            
      z(position) = x(position) + y(position).*1i;
      position = position + 1;
    end
   
end

%fuente: https://en.wikipedia.org/wiki/Archimedean_spiral 