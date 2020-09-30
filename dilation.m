function dilate = dilation(input_image)

    %read in the size of the image
    [height, width, numcolors]=size(input_image);

    dilate=zeros(height, width);



    for i=1:height
        for j=1:width

            if input_image(i,j) == 255 %center
                dilate(i,j) = 255;
            end
            if i+1 < height
                if input_image(i+1,j) == 255%north
                    dilate(i,j)=255;
                end
            end
            if i-1 > 0
                if input_image(i-1,j) == 255%south
                    dilate(i,j)=255;
                end
            end
            if j+1 < width
                if input_image(i,j+1) == 255%east
                    dilate(i,j)=255;
                end
            end
            if j-1 >0
                if input_image(i,j-1) == 255%west
                    dilate(i,j)=255;
                end
            end

        end
    end



%    ImageOut= uint8(dilate);
%    imwrite(ImageOut, 'dilate.bmp');
%    imshow(input_image)%show the output
    %input_image shuld now be updated

    end