function [] = visualize_XY_noisy_signal(x, xnoisy, y, ynoisy, theta)

    %% creación del primer subplot donde se grafica la señal en X
    %%variando como función de theta (con ruido y sin ruido)
    subplot(2,1,1)
    hold on
    plot(theta,xnoisy)
    plot(theta,x)
    legend({'Señal con ruido', 'Señal sin ruido'})
    hold off
    title(['Señal en el eje X variando con el tiempo'])
    
    %% creación del segundo subplot donde se grafica la señal en Y
    %%variando como función de theta (con ruido y sin ruido)
    subplot(2,1,2)
    hold on
    plot(theta,ynoisy)
    plot(theta,y)
    legend({'Señal con ruido', 'Señal sin ruido'})
    hold off
    title(['Señal en el eje Y variando con el tiempo'])
end