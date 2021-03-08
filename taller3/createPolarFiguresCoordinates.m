function [x,y,complex] = createPolarFiguresCoordinates(sincos,n,r)
% Esta función crea rosas en coordenadas polares. Recibe como parámetros
% 'sincos' que es si se realiza la rosa por medio de la función seno o
% coseno; 'n' que es una rosa de n pétalos si n es impar o 2n pétalos si n
% es par; 'r' que es la máxima disctancia que toma el radio.

    theta = 0:0.005:2*pi;
    x = zeros(1,length(theta));
    y = zeros(1,length(theta));
    
    for pos = 1:length(theta)
        if strcmp(sincos,'sin')
            x(pos) = (r.*sin(n.*theta(pos))).*cos(theta(pos));
            y(pos) = (r.*sin(n.*theta(pos))).*sin(theta(pos));
        elseif strcmp(sincos,'cos')
            x(pos) = (r.*cos(n.*theta(pos))).*cos(theta(pos));
            y(pos) = (r.*cos(n.*theta(pos))).*sin(theta(pos));
        end     
    end
    complex = x+(y.*1i);
    %plot(x,y)
end



