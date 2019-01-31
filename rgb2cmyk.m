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