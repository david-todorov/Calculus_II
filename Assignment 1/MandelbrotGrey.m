clear variables; close all; clc


dividers = 1000;
real_c = linspace(-1.5, 0.5, dividers);
imag_c = linspace(-1, 1, dividers);
[X, Y] = meshgrid(real_c, imag_c);
counter = X + Y * 1i;
N = 256;

matrix = zeros(size(counter));

for ii = 1:N

    matrix = matrix.^2 + counter;

end

matrix(abs(matrix) <= 2) = 0;
matrix(abs(matrix) > 2) = 1;

figure(1)
imshow(matrix,'X', [-1.5,0.5], 'Y', [-1,1])
colormap(gray(2))
axis on
grid on


title( 'Mandelbrot Set in Grey' );
xlabel('Real Number - axis');
ylabel('Imaginary Number - axis');