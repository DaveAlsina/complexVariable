function [] = visualize_XY_noisy_signal(x, xnoisy, y, ynoisy, theta)

    %% creación del primer subplot donde se grafica la señal en X
    %%variando como función de theta (con ruido y sin ruido)
    subplot(2,1,1)
    hold on
    plot(theta,xnoisy, 'LineStyle', '-.')
    plot(theta,x)
    legend({'Señal con ruido', 'Señal sin ruido'})
    hold off
    title(['Parte Real'])
    
    %% creación del segundo subplot donde se grafica la señal en Y
    %%variando como función de theta (con ruido y sin ruido)
    subplot(2,1,2)
    hold on
    plot(theta,ynoisy, 'LineStyle', '-.')
    plot(theta,y)
    legend({'Señal con ruido', 'Señal sin ruido'})
    hold off
    title(['Parte imaginaria'])
end