function erode = erosion(input_image)
    %read in the size of the image
    [height, width, numcolors]=size(input_image);

    erode=zeros(height, width);



    for i=1:height
        for j=1:width

            if j-1 > 0 && j+1 < width && i-1 > 0 && i+1 < height
               if input_image(i,j-1) == 255 %west
                   if input_image(i-1, j-1)%top left
                       if input_image(i-1, j-1)%bottom left
                   if input_image(i,j+1) ==255 %east
                       if input_image(i+1, j+1)%bottom right
                           if input_image(i+1, j-1)%top right
                       if input_image(i+1,j) == 255 %north
                           if input_image(i-1,j) == 255%south
                               erode(i,j)=255;
                           end
                       end
                           end
                       end
                   end
                       end
                   end
               end
            else
            erode(i,j) = 0;
            end

        end
    end


    ImageOut= uint8(erode);
    imwrite(ImageOut, 'erode.bmp');
    imshow(erode)%show the output
    %input_image shuld now be updated

    
end