%% Práctica 1
% Elabora:
%  - Dante F. Bazaldua Huerta
%  - Leonardo A. López Romero

%% Ejercicio 1
% imtool: El Visor de imágenes presenta un entorno integrado para mostrar la imágenes y realizar tareas comunes de procesamiento de imágenes.
% imfinfo: Imformación acerca del archivo de gráficas
% mat2gray: convierte una matriz a una imagen de escala de grises
% im2uint8: convierte una imagen a enteros de 8-bit sin signo
clear all;
clc;
elaboradoPor = "P1, by Dante Bazaldua and Leonardo Lopez"
pause;

%% Ejercicio 2
clear;
figure(1);
e = "Ejercicio 2"
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

pause;
%% Ejercicio 3 y 4
clear;
e = "Ejercicio 3 y 4"
figure(2);

subplot(1,2,1)
[x,map] = imread('trees.tif');
imshow(x, colormap(map)); % Indexando su mapa de color
subplot(1,2,2)
grises = ind2gray(x,map); % Conversi?n a gris
imshow(grises); % Sin indexar
title('gray');

% Conclusiones: La imagen que se muestra con el comando colormap muestra
% una peor distribución de grises conforme a la iamgen indexada que muestra
% una mayor nitidez y evita la pérdida de información de la imagen. 

pause;
%% Ejercicio 5
e = "Ejercicio 5"
varia_en_gris('moon.tif');

pause;
%% Ejercicio 6
clear;
e = "Ejercicio 6"
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

pause;

%% Ejercicio 7
e = "Ejercicio 7"
rgb2cmyk('peppers.png');
pause;

%% Ejercicio 8
e = "Ejercicio 8 (la salida es una imagen, favor de revisar el visor de archivos)."
x = imread('moon.tif');
figure
newLevel = bitand(x,(256-64));
imshow(newLevel, []), title(strcat(num2str(256/64), ' tonos'));
imwrite(newLevel,'luna.png');
pause;

function varia_en_gris( image_name )
% varia_en_gris Shows an image in the different gray colormap.
%   The color map varies from 2 to 128 in powers of 2

    clc;

    % Declare levels
    levels = [1,2,4,8,16,32,64,128];

    x = imread(image_name);
    figure;

    % Generate any level for k levels available
    for level = levels
        subplot(3,3,find(levels == level));
        % Core of the algorithm, divide the image between the levels you want
        % and show a spread colormap.
        newLevel = bitand(x, (256 - level));
        imshow(newLevel, []), title(strcat(num2str(256/level), ' tonos'));
    end


end



function rgb2cmyk( file_name )

    %rgb2cmyk Convert an image into a cmyk values and plot in a new figure.
    % 
    % This the algorithm to convert between RGB to CMY
    % [c]   [1]   [R]
    % [m] = [1] - [G]
    % [y]   [1]   [B]
    % 
    %  After this, we need the k or black value we do the following operations: 
    %  CMY -> CMYK = 
    %  [K]   [min(C,M,Y)]
    %  [C] = [(C-K)/(1-K)]
    %  [M]   [(M-K)/(1-k)]
    %  [Y]   [(Y-K)/(1-K)]

    img = imread(file_name);
    img = im2double(img);

    % Get the image's complement.
    cmyk = imcomplement(img);

    cyan = cmyk(:,:,1);
    magenta = cmyk(:,:,2);
    yellow = cmyk(:,:,3);

    [mc, ic] = min(cyan(:));
    [mm, im] = min(magenta(:));
    [my, iy] = min(magenta(:));

    new_min = cat(3, mc, mm, my);

    k = min(new_min);

    chcyan = (cyan - k)/(1-k);
    chmagenta = (magenta - k)/(1-k);
    chyellow = (yellow - k)/(1-k);

    figure, subplot(2,2,1), imshow(img), title('Original RGB');
    o = ones(size(img, 1), size(img, 2));


    jcyan = cat(3, chcyan, o, o);
    subplot(2,2,2), imshow(jcyan), title('Cyan');
    jmagenta = cat(3, o, chmagenta, o);
    subplot(2,2,3), imshow(jmagenta), title('Magenta');
    jyellow = cat(3, o, o, chyellow);
    subplot(2,2,4), imshow(jyellow), title('Yellow');


end
