function erode = MagErode(input_image)
    %read in the size of the image
    [height, width, numcolors]=size(input_image);

    erode=input_image;



    for i=1:height
        for j=1:width

            if j-1 > 0 && j+1 < width && i-1 > 0 && i+1 < height
               if input_image(i,j-1) >0 %west
                   if input_image(i-1, j-1)>0%top left
                       if input_image(i-1, j-1)>0%bottom left
                            if input_image(i,j+1) >0 %east
                                if input_image(i+1, j+1)>0%bottom right
                                    if input_image(i+1, j-1)>0%top right
                                         if input_image(i+1,j) >0 %north
                                             if input_image(i-1,j) > 0%south
                                                 if input_image(i,j) == 0
                                                      erode(i,j)=input_image(i, j-1);
                                                 else
                                                      erode(i,j) = input_image(i, j);
                                                 end
                                             end
                                         end
                                    end
                                end
                           end
                       end
                   end
               end
            end
        end
    end



    
end