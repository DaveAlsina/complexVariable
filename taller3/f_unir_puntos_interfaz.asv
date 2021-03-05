function [z_unidos] = f_unir_puntos_interfaz(z_puntos)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

z_unidos = zeros(1,length(t)*(length(z)-1)+length(z));
start = 1;
    for it = 2 :length(z_puntos)
        segment_vector = linspace(z_puntos(it-1),z_puntos(it)); 
        z_unidos(start: start + length(segment_vector)) = segment_vector;
        start = start +length(segment_vector);
    end
end

