
function double_image = floodfill_output(input_image, double_image, x, y, RGB, old_color)

    [height, width, numcolors]=size(input_image);
    %double_image=double(input_image);
    frontierx=[];
    frontiery=[];
    
        for k=1:numcolors
    %set the old color that we are going to overwrite
            %old_color = input_image(x,y,k);
            %if old_color == k
            %    return
            %end
            %initialize out frontiers to hold our neighbors
            frontierx = [frontierx x];
            frontiery = [frontiery y];
            %update the new image
            if k == 1
                double_image(x,y,k) = RGB(k);
            elseif k == 2
                double_image(x,y,k) = RGB(k);
            else
                double_image(x,y,k) = RGB(k);
            end


            while length(frontierx) > 0 && length(frontiery) > 0
                qx = frontierx(length(frontierx));%copy last x
                frontierx(length(frontierx))=[];%pop x
                qy = frontiery(length(frontiery));%copy last y
                frontiery(length(frontiery))=[];%pop y
                %upadate the frontier and the neighbors fo the pixel need to
                %check both the input image and the output image
            if (qx+1 <height && qy+1<=width)
                if input_image(qx+1,qy+1,k) == old_color && double_image(qx+1,qy+1,k) ~= RGB(k)
                    frontierx = [frontierx qx+1];
                    frontiery = [frontiery qy+1];
                    double_image(qx+1,qy+1,k) = RGB(k);
                end
            end
            if (qx+1 < height)
                input_image(qx+1,qy,k);
                if input_image(qx+1,qy,k) == old_color&& double_image(qx+1,qy,k) ~= RGB(k)
                    frontierx = [frontierx qx+1];
                    frontiery = [frontiery qy];
                    double_image(qx+1,qy,k) = RGB(k);
                end
            end
            if (qx+1 < height && qy-1>0)
                input_image(qx+1,qy-1,k);
                if input_image(qx+1,qy-1,k) == old_color&& double_image(qx+1,qy-1,k) ~= RGB(k)
                    frontierx = [frontierx qx+1];
                    frontiery = [frontiery qy-1];
                    double_image(qx+1,qy-1,k) = RGB(k);
                end
            end
            if (qy-1>0)
                input_image(qx,qy-1,k);
                if input_image(qx,qy-1,k) == old_color&& double_image(qx,qy-1,k) ~= RGB(k)
                    frontierx = [frontierx qx];
                    frontiery = [frontiery qy-1];
                    double_image(qx,qy-1,k) = RGB(k);
                end
            end
            if (qx-1>0 && qy-1>0)
                input_image(qx-1,qy-1,k);
                if input_image(qx-1,qy-1,k) == old_color&& double_image(qx-1,qy-1,k) ~= RGB(k)
                    frontierx = [frontierx qx-1];
                    frontiery = [frontiery qy-1];
                    double_image(qx-1,qy-1,k) = RGB(k);
                end
            end
            if (qx-1>0)
                input_image(qx-1,qy,k);
                if input_image(qx-1,qy,k) == old_color&& double_image(qx-1,qy,k) ~= RGB(k)
                    frontierx = [frontierx qx-1];
                    frontiery = [frontiery qy];
                    double_image(qx-1,qy,k) = RGB(k);
                end
            end
            if(qx-1 > 0 && qy+1 <= width)
                input_image(qx-1,qy+1,k);
                if input_image(qx-1,qy+1,k) == old_color&& double_image(qx-1,qy+1,k) ~= RGB(k)
                    frontierx = [frontierx qx-1];
                    frontiery = [frontiery qy+1];
                    double_image(qx-1,qy+1,k) = RGB(k);
                end
            end
            if(qy+1 <= width)
                input_image(qx,qy+1,k);
                if input_image(qx,qy+1,k) == old_color&& double_image(qx,qy+1,k) ~= RGB(k)
                    frontierx = [frontierx qx];
                    frontiery = [frontiery qy+1];
                    double_image(qx,qy+1,k) = RGB(k);
                end
            end



    end

        end
        %wrtie the output and show in matlab
    %ImageOut= uint8(double_image);
    %imwrite(ImageOut, 'out_floodfill.bmp');
    %imshow(uint8(double_image));
    
    end