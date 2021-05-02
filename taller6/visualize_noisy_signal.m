function [] = visualize_noisy_signal(z, znoisy, title_)

    grid on;
    axis equal;
    
    %% graficado de la señal sin ruido con color negro y de la ruidosa en azul
    hold on;
        plot(z, '-k');
        plot(znoisy, '-.b');
        title([title_]);            %añade el título a la imagen
        legend(["Señal sin Ruido","Señal con Ruido"]);
    hold off;
end