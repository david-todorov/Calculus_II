clear variables; close all; clc


divider = 1200;
real_c = linspace(-1.5, 0.5, divider);
imag_c = linspace(-1, 1, divider);
[X, Y] = meshgrid(real_c, imag_c);
counter = X + Y * 1i;
N = 256;

a = zeros(size(counter));
b = zeros(size(counter));

for ii = 1:N

    a = a.^2 + counter;
    index = (abs(a) > 2);
    b(index) = ii;
    a(index) = 0;

    counter(index) = 0;

end

figure(1)
imshow(b, [0,256], 'X', [-1.5,0.5], 'Y', [-1,1])
colormap(hsv(256))

axis on
grid on

title( 'Mandelbrot in Color' );
xlabel('Real Number - axis');
ylabel('Imaginary number - axis');