%% Pr?ctica 1
% Elabora:
%  - Dante F. Bazaldua Huerta
%  - Leonardo A. L?pez Romero

%% Ejercicio 1
% imtool: El Visor de im?genes presenta un entorno integrado para mostrar la im?gene y realizar tareas comunes de procesamiento de im?genes.
% imfinfo: Imformaci?n acerca del archivo de gr?ficas
% mat2gray: convierte una matriz a una imagen de escala de grises
% im2uint8: convierte una imagen a enteros de 8-bit sin signo

%% Ejercicio 2
clear;
figure(1);
y = imread('fabric.png');

% Imagen completa
subplot(2,2,1)
imshow(y,[])
title('Imagen completa')
colorbar

% Rojo
subplot(2,2,2)
imshow(y(:,:,1),[])
title('Rojo')
colorbar

% Verde
subplot(2,2,3)
imshow(y(:,:,2),[])
title('Verde')
colorbar

% Azul
subplot(2,2,4)
imshow(y(:,:,3),[])
title('Azul')
colorbar


%% Ejercicio 3 y 4
clear;
figure(2);

subplot(1,2,1)
[x,map] = imread('trees.tif');
imshow(x, colormap(map)); % Indexando su mapa de color
subplot(1,2,2)
grises = ind2gray(x,map); % Conversi?n a gris
imshow(grises); % Sin indexar
title('gray');

% Observaciones: En este caso como se muestra la im?gen con su mapa de
% color, Matlab traduce el mayor y el menor valor y los hace ser min y max
% en lugar de ocupar 0 y 255.


%% Ejercicio 5
varia_en_gris('moon.tif');


%% Ejercicio 6
clear;
x = imread('peppers.png');
figure
subplot(2,1,1)
imshow(x);
title('normal')
subplot(2,1,2)
gray = rgb2gray(x);
imshow(gray);
title('gris')
figure
subplot(2,2,1)
hsv = rgb2hsv(x);
imshow(x);
title('hsv')
subplot(2,2,2)
hsv = rgb2hsv(x);
imshow(hsv(:,:,1),[]);
title('h')
subplot(2,2,3)
hsv = rgb2hsv(x);
imshow(hsv(:,:,2),[]);
title('s')
subplot(2,2,4)
hsv = rgb2hsv(x);
imshow(hsv(:,:,3),[]);
title('v')
figure
subplot(2,2,1)
ycbcr = rgb2ycbcr(x);
imshow(x);
title('ycbcr')
subplot(2,2,2);
imshow(ycbcr(:,:,1),[])
title('canal 1')
subplot(2,2,3);
imshow(ycbcr(:,:,2),[])
title('canal 2')
subplot(2,2,4);
imshow(ycbcr(:,:,3),[])
title('canal 3')


%% Ejercicio 7
rgb2cmyk('peppers.png');

%% Ejercicio 8
x = imread('moon.tif');
figure
newLevel = bitand(x,(256-64));
imshow(newLevel, []), title(strcat(num2str(256/64), ' tonos'));
imwrite(newLevel,'luna.png');

