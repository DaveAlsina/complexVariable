function [] = visualize_noisy_signal(x, xnoisy, y, ynoisy, title_)

    grid on;
    axis equal;

    hold on;
        plot(x, y, 'k');
        plot(xnoisy ,ynoisy, 'b', 'LineStyle', '-.');
        title([title_]);
    hold off;
end