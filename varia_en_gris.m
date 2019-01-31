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




