function [z_unidos] = f_unir_puntos_interfaz(z_puntos)

    % input: arreglo de coordenadas en el plano (z_puntos)
    % La función retorna todos los puntos que pertenecen a los segmentos  
    % formados por z_puntos

    z_unidos = [];
    counter = 1;
    
    for it = 1:length(z_puntos)-1
        for t = 0:0.01:1
            point = ((1 - t)*z_puntos(it)) + (t*z_puntos(it + 1));
            z_unidos(counter) = point;
            counter = counter + 1;
        end
    end
end

