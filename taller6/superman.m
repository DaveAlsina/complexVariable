%% Parametrización de la figura
dt = 0.01;
t = 0:dt:28;

%x = -12.*abs(t) + 16.*abs(t-1) + 12.*abs(t-2) - 12.*abs(t-3) - 16.*abs(t-4) + (19/2).*abs(t-5) + (15/2) .*abs(t-6) - (15/2).*abs(t-7) - 2.*abs(t-8) + (5/2).*abs(t-9) + (17/2).*abs(t-10) - (13/2).*abs(t-11) + (5/2).*abs(t-13) - abs(t-14) - (3/2).*abs(t-15) - (3/2).*abs(t-16) - (5/4).*abs(t-17) + (11/4).*abs(t-18) + 4.*abs(t-22) - 4.*abs(t-23) + 2.*abs(t-24) - (1/2).*abs(t-25) -2.*abs(t-26) + (1/2).*abs(t-27) +(5/4).*((abs(t-15)-abs(t-16)-1).^2) -(1/2).*(abs(t-27)-abs(t-28)+1).^2 + (19/2).*cos((pi/4).*(abs(t-11)-abs(t-13))) + 14.*cos((pi/4).*(abs(t-18)-abs(t-19)+1)) - (3/4).*(abs(t-18)-abs(t-19)) - (17/2).*cos((pi/4).*(abs(t-19) -abs(t-21))) + 9.*sin((pi/4).*(abs(t-21)-abs(t-22)+1)) - 10.*(abs(t-13)/(t-13)) + 20.*(abs(t-17)/(t-17)) - 6.*(abs(t-25)/(t-25)) - 9;
%y = 14.*abs(t) - 10.*abs(t-1) -4.*abs(t-2) - 4.*abs(t-3) - 10.*abs(t-4) + (203/12).*abs(t-5) - (35/12) .*abs(t-6) - (35/12).*abs(t-7) + (35/12).*abs(t-8) + (7/3).*abs(t-9) - (7/3).*abs(t-10) + (5/2).*abs(t-13) - (5/2).*abs(t-14) - (17/4).*abs(t-15) + 6.*abs(t-16) - (119/24).*abs(t-17) + (77/24).*abs(t-18) + (5/2).*abs(t-23) - (9/2).*abs(t-24) + 2.*abs(t-25) + abs(t-27) - abs(t-28) +(1/2).*((abs(t-6)-abs(t-7)).^2) -(21/8).*((abs(t-8)-abs(t-9) -(1/9)).^2) +(11/24).*((abs(t-10)-abs(t-11)-1).^2) + (1/4).*(abs(t-26)-abs(t-27)-2).^2 -2.*sin((pi/4).*(abs(t-11)-abs(t-13))) + (53/12).*sin((pi/4).*(abs(t-18)-abs(t-19)+1)) + (7/2).*sin((pi/4).*(abs(t-19)-abs(t-21))) - 6.*sin((pi/4).*(abs(t-21)-abs(t-22)-1)) + (7/3).*(abs(t-5)/(t-5)) + (14/3).*(abs(t-8)/(t-8)) + 7.*abs(t-13)/(t-13) + (5/2).*abs(t-25)/(t-25) - 1451/216;

%plot(x,y)
%ex = -12.*abs(t) + 16.*abs(t-1) + 12.*abs(t-2) - 12.*abs(t-3) - 16.*abs(t-4) + (19/2).*abs(t-5) + (15/2) .*abs(t-6) - (15/2).*abs(t-7) - 2.*abs(t-8) + (5/2).*abs(t-9) + (17/2).*abs(t-10) - (13/2).*abs(t-11) + (5/2).*abs(t-13) - abs(t-14) - (3/2).*abs(t-15) - (3/2).*abs(t-16) - (5/4).*abs(t-17) + (11/4).*abs(t-18) + 4.*abs(t-22) - 4.*abs(t-23) + 2.*abs(t-24) - (1/2).*abs(t-25) -2.*abs(t-26) + (1/2).*abs(t-27);
%ey = 14.*abs(t) - 10.*abs(t-1) -4.*abs(t-2) - 4.*abs(t-3) - 10.*abs(t-4) + (203/12).*abs(t-5) - (35/12) .*abs(t-6) - (35/12).*abs(t-7) + (35/12).*abs(t-8) + (7/3).*abs(t-9) - (7/3).*abs(t-10) + (5/2).*abs(t-13) - (5/2).*abs(t-14) - (17/4).*abs(t-15) + 6.*abs(t-16) - (119/24).*abs(t-17) + (77/24).*abs(t-18) + (5/2).*abs(t-23) - (9/2).*abs(t-24) + 2.*abs(t-25) + abs(t-27) - abs(t-28);
%plot(ex,ey)
x = zeros(length(t));
y = zeros(length(t));
for i = 1:length(t)
    x(i) = -12.*abs(t(i)) + 16.*abs(t(i)-1) + 12.*abs(t(i)-2) - 12.*abs(t(i)-3) - 16.*abs(t(i)-4) + (19/2).*abs(t(i)-5) + (15/2) .*abs(t(i)-6) - (15/2).*abs(t(i)-7) - 2.*abs(t(i)-8) + (5/2).*abs(t(i)-9) + (17/2).*abs(t(i)-10) - (13/2).*abs(t(i)-11) + (5/2).*abs(t(i)-13) - abs(t(i)-14) - (3/2).*abs(t(i)-15) - (3/2).*abs(t(i)-16) - (5/4).*abs(t(i)-17) + (11/4).*abs(t(i)-18) + 4.*abs(t(i)-22) - 4.*abs(t(i)-23) + 2.*abs(t(i)-24) - (1/2).*abs(t(i)-25) -2.*abs(t(i)-26) + (1/2).*abs(t(i)-27) +(5/4).*((abs(t(i)-15)-abs(t(i)-16)-1).^2) -(1/2).*(abs(t(i)-27)-abs(t(i)-28)+1).^2 + (19/2).*cos((pi/4).*(abs(t(i)-11)-abs(t(i)-13))) + 14.*cos((pi/4).*(abs(t(i)-18)-abs(t(i)-19)+1)) - (3/4).*(abs(t(i)-18)-abs(t(i)-19)) - (17/2).*cos((pi/4).*(abs(t(i)-19) -abs(t(i)-21))) + 9.*sin((pi/4).*(abs(t(i)-21)-abs(t(i)-22)+1)) - 10.*(abs(t(i)-13)/(t(i)-13)) + 20.*(abs(t(i)-17)/(t(i)-17)) - 6.*(abs(t(i)-25)/(t(i)-25)) - 9;
    y(i) = 14.*abs(t(i)) - 10.*abs(t(i)-1) -4.*abs(t(i)-2) - 4.*abs(t(i)-3) - 10.*abs(t(i)-4) + (203/12).*abs(t(i)-5) - (35/12) .*abs(t(i)-6) - (35/12).*abs(t(i)-7) + (35/12).*abs(t(i)-8) + (7/3).*abs(t(i)-9) - (7/3).*abs(t(i)-10) + (5/2).*abs(t(i)-13) - (5/2).*abs(t(i)-14) - (17/4).*abs(t(i)-15) + 6.*abs(t(i)-16) - (119/24).*abs(t(i)-17) + (77/24).*abs(t(i)-18) + (5/2).*abs(t(i)-23) - (9/2).*abs(t(i)-24) + 2.*abs(t(i)-25) + abs(t(i)-27) - abs(t(i)-28) +(1/2).*((abs(t(i)-6)-abs(t(i)-7)).^2) -(21/8).*((abs(t(i)-8)-abs(t(i)-9) -(1/9)).^2) +(11/24).*((abs(t(i)-10)-abs(t(i)-11)-1).^2) + (1/4).*(abs(t(i)-26)-abs(t(i)-27)-2).^2 -2.*sin((pi/4).*(abs(t(i)-11)-abs(t(i)-13))) + (53/12).*sin((pi/4).*(abs(t(i)-18)-abs(t(i)-19)+1)) + (7/2).*sin((pi/4).*(abs(t(i)-19)-abs(t(i)-21))) - 6.*sin((pi/4).*(abs(t(i)-21)-abs(t(i)-22)-1)) + (7/3).*(abs(t(i)-5)/(t(i)-5)) + (14/3).*(abs(t(i)-8)/(t(i)-8)) + 7.*abs(t(i)-13)/(t(i)-13) + (5/2).*abs(t(i)-25)/(t(i)-25) - 1451/216;
end
%plot(x,y)

% Ruido
rng(2,'twister');
ruidox = 1.*randn(length(x),1);

rng(4,'twister');
ruidoy = 1.*randn(length(x),1);

newx = x + ruidox;
newy = y + ruidoy;

%plot(newx,newy)
sinruido = complex(x,y);
conruido = complex(newx,newy);

%% Análisis del ruido
% Análisis por cada eje
%visualize_XY_noisy_signal(x, newx, y, newy, t);
% Análisis en el planoparametrizacion
%visualize_noisy_signal(sinruido, conruido, ['Supermán ruidoso']);

%% Coeficientes de Fourier 
% Filtrado más agresivo
[fft_clean] = plot_clean_vs_noisy_fft(t, dt, max(abs(conruido))/20, conruido);
reconstruccion1 = ifft(fft_clean);
%plot(reconstruccion1, '-b');

% Filtrado menos agresivo
z_fft = fft(conruido);
z_fft_clean2(2:98) = 0;
reconstruccion2 = ifft(z_fft);

% Graficación de ángulos de coeficientes de Forurier
plot_angles_fft(sinruido, conruido);
