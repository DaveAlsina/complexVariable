function [] = graphProyectionInRiemmanSphere(z, color)

    % Input: z, el vector con la serie de puntos que componen 
    % las figuras en el plano complejo
    
    % Obtención de los puntos en X, Y y Z que componen 
    % la esfera para su posterior uso en graficación
    [X, Y, Z] = sphere; 

    axis equal
    grid on

    % 0.8*[1,1,1] -> gris en RGB
    surf(X, Y, Z, 'FaceColor', 'none', 'EdgeColor', 0.8*[1,1,1])

    % creacion de 3 vectores del largo de z
    x1 = zeros(1, length(z));
    x2 = zeros(1, length(z));
    x3 = zeros(1, length(z));
    
    % iterador
    it = 1;                 

    % itera a través de la serie de puntos complejos que componen la
    % gráfica 
    for num = z
        
        % proyecta cada uno de los puntos complejos en la esfera de riemann
        % y guarda las componentes en x1, x2 y x3 de la proyección 
        % en los vectores con nombre correspondiente
        
        [temp_a, temp_b, temp_c] = rectangularToSphere(real(num), imag(num));
        x1(it) = temp_a;
        x2(it) = temp_b;
        x3(it) = temp_c;
        
        it = it + 1;    % aumenta la cuenta del iterador
    end
    plot3(x1, x2, x3, 'Color', color)
    
end

% hold on
% plot3(x, y, z, '.', 'MarkerSize', 15)
% hold off