function [label,im_labels] = watershedMarker(magnitude,marker)
%retrns label- the label image, im_labels - the label values
%needs the magnitude image an the marker image to run
%image=Image(2:127,2:127);% image crop to avoid oversegmenting 
[height,width]=size(magnitude);% size 
%{
for i =1:height
    for j = 1:width
            Marker(1,j) = 0;
            Marker(height, j) = 0;
            Marker(i, 1) = 0;
            Marker(i, width) = 0;
    end
end
%}
gray = cell(1, 256);

%1-> a) level pixel list 
for i=0:255
    [y,x] = find(magnitude == i);

    gray{i+1} = [y,x];
end
% 1-> b set label to -1 
label=-1*ones(height,width); % initilize label variable with -1 
% 1-> c global label
globallabel=0;
  % create cashment basins using connected component 
 [label,im_labels] = ConnectedComponentsFloodfill(marker);
 figure; imshow(uint8(label));
 title('Marker-Based Watershed: Labeled Components');
 for i = 1: height
     for j = 1: width
         if label(i,j) == 0
             label(i,j) = -1;
         end
     end
 end
%% step 2 :

frontierx = [];%create
frontiery = [];%create
for g=1:256 % 256- grey scale levels 
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
                   if(magnitude(pixelX2, pixelY2) <= g-1 && label(pixelX2, pixelY2) == -1 && label(pixelX, pixelY) ~= -1 )
                       %label(pixelX2-i, pixelY2-j);
                       label(pixelX2, pixelY2) = label(pixelX, pixelY);
                       frontierx = [frontierx pixelX2];%push
                       frontiery = [frontiery pixelY2];%push
                    end
                end
            end
        end

    end



end

