function [z_unidos] = f_unir_puntos_interfaz(z_puntos)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
t = 0:0.01:1;
z_unidos = zeros(1,length(t)*(length(z_puntos)-1));
posicion = 1;

    for it = 2 :length(z_puntos)
        for t = 0:0.01:1
            temp = (1 - t)*z_puntos(it - 1) + t*z_puntos(it);
            z_unidos(posicion) = temp;
            posicion = posicion + 1;
        end
%         segment_vector = linspace(z_puntos(it-1),z_puntos(it)); 
%         z_unidos(start: start + length(segment_vector) - 1) = segment_vector;
%         start = start +length(segment_vector);
    end
end

