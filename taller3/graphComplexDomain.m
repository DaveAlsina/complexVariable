function [] = graphComplexDomain(x, y, Title, color)

    % input: arreglo con valores del eje x (x)
    % arreglo con valores del eje y (y)

    grid on;
    title(Title)
    xlabel('Real');
    ylabel('Imaginario');
    plot(x,y, 'Color', color);
end