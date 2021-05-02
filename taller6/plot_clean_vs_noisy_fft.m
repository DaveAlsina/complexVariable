function [coefs] = plot_clean_vs_noisy_fft(samples, step, threshold, x)
    n = length(samples);
    coefs = fft(x, n);  
    PSD = 2.*abs(coefs/n);      % power spectrum density
    freq = 1/(step*n)*(0:n-1);
    L = 1:floor(n/2);
    
    
    indices = PSD > threshold;
    PSDclean = PSD.*indices;
    coefs2 = coefs;             %numeros complejos que se quedan sin filtrar
    coefs = indices.*coefs;     %numeros aplicación de filtro a los números complejos

    figure
    hold on
        plot(freq,abs(coefs2), '--b');
        plot(freq,abs(coefs), 'r');
        legend(['Número complejo con ruido'], ['Número complejo sin ruido']);
        title(['Amplitud de los Coeficientes de Fourier']);
    hold off
      
end