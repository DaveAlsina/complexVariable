clc
clear
close all

%% Proyección estereográfica
% z = 2 + 1i*3; 
% [a, b, c] = rectangularToSphere(real(z), imag(z));

%% Hipocicloide
k = 2.1;
r2 = 1;
t = 0:0.01:20*pi;
x = (k*r2 - r2)*cos(t) + r2*cos(t*(1 - k));
y = (k*r2 - r2)*sin(t) + r2*sin(t*(1 - k));
z = x + 1i*y;

%% Graficamos en la esfera
[X, Y, Z] = sphere;

axis equal
grid on

% 0.8*[1,1,1] -> gris en RGB
surf(X, Y, Z, 'FaceColor', 'none', 'EdgeColor', 0.8*[1,1,1])

a = zeros(1, length(z));
b = zeros(1, length(z));
c = zeros(1, length(z));
it = 1;

for num = z
    [temp_a, temp_b, temp_c] = rectangularToSphere(real(num), imag(num));
    a(it) = temp_a;
    b(it) = temp_b;
    c(it) = temp_c;
    it = it + 1;
end

hold on
plot3(a, b, c, 'Color', 'Black')
hold off

% hold on
% plot3(x, y, z, '.', 'MarkerSize', 15)
% hold off
