function [label] = watershed(input_image)
%WATERSHED Summary of this function goes here
%   Detailed explanation goes here
%magnitude = [0 3 3 1 3; 3 4 1 2 2; 5 4 2 0 2; 4 0 3 4 3; 5 4 5 4 0]
%input_image = rgb2gray(input_image);

[height, width]=size(input_image);

%figure; imshow(uint8(input_image));
%title('Input Image');
%initialization 

gray = cell(1, 256);
magnitude = uint8(input_image);
%magnitude = MagErode(magnitude);
%magnitude = dilation(magnitude);

% get all the grayscale set up 
%due to matlab indeing strting at 1 grayscale 0 is in gray{1} and so on
for i=0:255
    [y,x] = find(magnitude == i);

    gray{i+1} = [y,x];
end

%set all labels to -1
label = double(magnitude);
for i=1:height
    for j=1:width
        label(i,j) = -1;
    end
end

globalLabel = 0;

%flood topological surface one graylevel at a time
temp_label = label;

frontierx = [];%create
frontiery = [];%create
%will need to change back to get proper output for the bigger image
for g=1:255
    temp_label = label;
    pixellist=gray{g};
    label;
   
   
% grow the existing catchment basins by one pixel, creating the initial frontier
    for i =1:size(pixellist,1)
            neighbor = -1;
            xnew = -1;
            ynew = -1;
            x = pixellist(i,1);
            y = pixellist(i,2);
            if label(x,y) < 0
                
                [neighbor, xnew, ynew] = anynearest8_water(temp_label, magnitude, pixellist(i,1), pixellist(i,2), g-1);
                
            end
            % for each pixel p such that img[p]=g and there exists a neighbor q for p for which (temp_labe (q) >=0
             if neighbor > 0 && xnew > 0 && ynew > 0
                m = label(pixellist(i));
                l = label(xnew, ynew);
                x  = pixellist(i,1);
                y = pixellist(i,2);
                label(x,y)= label(xnew,ynew);
                frontierx = [frontierx pixellist(i,1)];%push
                frontiery = [frontiery pixellist(i,2)];%push
                label;
            end
           
        
    end
    label;
    %continue to grow existing basins one pixel thick each iteration by expanding frontier
    while size(frontierx) > 0
        pixelX = frontierx(length(frontierx));%copy last
        frontierx(length(frontierx))=[];%pop
        pixelY = frontiery(length(frontiery));%copy last
        frontiery(length(frontiery))=[];%pop
        
        % for each neighbor q of p such that img[q] == g and label[q] = -1
        for i = -1:1
            for j = -1:1
                pixelX2 = pixelX + i;
                pixelY2 = pixelY+j;
                if pixelX2<= height && pixelX2 > 0 && pixelY2 <= width && pixelY2 > 0
                   if(magnitude(pixelX2, pixelY2) == g-1 && label(pixelX2, pixelY2) == -1 && label(pixelX, pixelY) ~= -1 )
                       %label(pixelX2-i, pixelY2-j);
                       label(pixelX2, pixelY2) = label(pixelX, pixelY);
                       frontierx = [frontierx pixelX2];%push
                       frontiery = [frontiery pixelY2];%push
                    end
                end
            end
        end
        
    end
    
    % create new catchment basins 
    % for each p such that img[p] =-1 
    xCoord = -1;
    yCoord = -1; 
    
  

            if size(gray{g}) >0
                for k = 1:size(gray{g}, 1)
                    xCoord = gray{g}(k);
                    yCoord = gray{g}(k,2);
                    if label(xCoord, yCoord) == -1 && magnitude(xCoord,yCoord) == g-1
                        label = floodfill_output(magnitude, label, xCoord, yCoord, globalLabel, g-1);
                        globalLabel = globalLabel+1;
                    end
                end
            end
    
end
    
  
   % figure; imshow(uint8(255*label/(max(max(label)))));
%    title('Label');

    

end

