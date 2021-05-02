function [coefs_n] = plot_angles_fft(cleanSignal, noisySignal)
       
    coefs = fft(cleanSignal);
    coefs_n = fft(noisySignal);

    %% graficado de los ángulos de los números complejos sin afectar por el ruido
    
    figure
    hold on
        plot(angle(coefs), 'r')   
                                  

        title(["Ángulo de los Coeficientes de Fourier [No] Afectados por el Ruido"]);
        xlabel(["Muestras [K]"]);
        ylabel(["Amplitud [u.a]"]);
    hold off

    %% graficado de los ángulos de los números complejos afectados por el ruido
    
    figure
    hold on
    plot(angle(coefs_n), '--b')
                               
    title(["Ángulo de los Coeficientes de Fourier Afectados por el Ruido"]);
    xlabel(["Muestras [K]"]);
    ylabel(["Amplitud [u.a]"]);


end