function [] = visualize_XY_noisy_signal(x, xnoisy, y, ynoisy, theta)

    %% creación del primer subplot donde se grafica la señal en X
    %%variando como función de theta (con ruido y sin ruido)
    subplot(2,1,1)
    hold on
    plot(xnoisy, 'LineStyle', '-.')
    plot(x)
    legend({'Señal con ruido', 'Señal sin ruido'})
    hold off
    title(['Parte Real'])
    
    %% creación del segundo subplot donde se grafica la señal en Y
    %%variando como función de theta (con ruido y sin ruido)
    subplot(2,1,2)
    hold on
    plot(ynoisy, 'LineStyle', '-.')
    plot(y)
    legend({'Señal con ruido', 'Señal sin ruido'})
    hold off
    title(['Parte imaginaria'])
end