function PSDclean = plot_XY_ifft(theta, x_ifft, y_ifft, title_)

    hold on
    plot(theta, x_ifft, 'b');
    plot(theta, y_ifft, 'r');
    legend(['X reconstruido'], ['Y reconstruido']);
    title([title_]);
    hold off

end