function [] = plot_clean_vs_noisy_fft(samples, step, threshold, x)
    n = length(samples);
    coefs = fft(x, n);
    PSD = coefs.*conj(coefs)/n; % power spectrum density
    freq = 1/(step*n)*(0:n);
    L = 1:floor(n/2);
    
    indices = PSD > threshold;
    PSDclean = PSD.*indices;
    coefs = indices.*coefs;
%     filtered = ifft(coefs);
    figure
    hold on
    plot(freq(L), PSD(L), 'b')
    plot(freq(L), PSDclean(L), 'r')
    legend(['Componentes con ruido'], ['Componentes sin ruido'])
    hold off
end