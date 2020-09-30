function [output, labels] = ConnectedComponentsFloodfill(input_image)


[height, width]=size(input_image);
output = zeros(height, width);
frontierx=[];
frontiery=[];
labels=[];

for i=1:height
    for j = 1:width
        if input_image(i,j) == 255 && output(i,j) ==0
            x=i;
            y=j;
            color = randi(255);
            labels = [labels color];

    %set the old color so that we can identify what color to get rid of
            old_color = input_image(x,y);
            if old_color == color
                return
            end
    %initialize out frontiers(stack) that we use to know where we are
            frontierx = [frontierx x];
            frontiery = [frontiery y];



            %main loop to complete the floodfill
            while length(frontierx) > 0 && length(frontiery) > 0




                qx = frontierx(length(frontierx));%copy last x
                frontierx(length(frontierx))=[];%pop x
                qy = frontiery(length(frontiery));%copy last y
                frontiery(length(frontiery))=[];%pop y
                %the folowing loos at the neighbors and updates the frontiers
                %and the pixel color

            if (qx+1 <height && qy+1<=width)
                if input_image(qx+1,qy+1) == old_color && output(qx+1,qy+1) ~= color
                    frontierx = [frontierx qx+1];
                    frontiery = [frontiery qy+1];
                    output(qx+1,qy+1) = color;
                end
            end
            if (qx+1 < height)
                input_image(qx+1,qy);
                if input_image(qx+1,qy) == old_color && output(qx+1,qy) ~= color
                    frontierx = [frontierx qx+1];
                    frontiery = [frontiery qy];
                    output(qx+1,qy) = color;
                end
            end
            if (qx+1 < height && qy-1>0)
                input_image(qx+1,qy-1);
                if input_image(qx+1,qy-1) == old_color && output(qx+1,qy-1) ~= color
                    frontierx = [frontierx qx+1];
                    frontiery = [frontiery qy-1];
                    output(qx+1,qy-1) = color;
                end
            end
            if (qy-1>0)
                input_image(qx,qy-1);
                if input_image(qx,qy-1) == old_color && output(qx,qy-1) ~= color
                    frontierx = [frontierx qx];
                    frontiery = [frontiery qy-1];
                    output(qx,qy-1) = color;
                end
            end
            if (qx-1>0 && qy-1>0)
                input_image(qx-1,qy-1);
                if input_image(qx-1,qy-1) == old_color && output(qx-1,qy-1) ~= color
                    frontierx = [frontierx qx-1];
                    frontiery = [frontiery qy-1];
                    output(qx-1,qy-1) = color;
                end
            end
            if (qx-1>0)
                input_image(qx-1,qy);
                if input_image(qx-1,qy) == old_color && output(qx-1,qy) ~= color
                    frontierx = [frontierx qx-1];
                    frontiery = [frontiery qy];
                    output(qx-1,qy) = color;
                end
            end
            if(qx-1 > 0 && qy+1 <= width)
                input_image(qx-1,qy+1);
                if input_image(qx-1,qy+1) == old_color && output(qx-1,qy+1) ~= color
                    frontierx = [frontierx qx-1];
                    frontiery = [frontiery qy+1];
                    output(qx-1,qy+1) = color;
                end
            end
            if(qy+1 <= width)
                input_image(qx,qy+1);
                if input_image(qx,qy+1) == old_color && output(qx,qy+1) ~= color
                    frontierx = [frontierx qx];
                    frontiery = [frontiery qy+1];
                    output(qx,qy+1) = color;
                end
            end

    
            end

        end
        
    end
end
  
%imwrite(ImageOut, FileName);
%imshow(output)%show the output
%input_image shuld now be updated


end


