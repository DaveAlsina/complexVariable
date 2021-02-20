

function [r, theta] = convertToRad(x)

    %display(x)

    %calculo de la longitud del radio
    r = sqrt( real(x).^2 + imag(x).^2 );
    
    %calculo del ángulo 
    theta =  atan( imag(x) / real(x) );

end

