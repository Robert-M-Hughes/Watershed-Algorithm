%double threshold

%open up the pathway to file and set as the input

function double_thresh = double_threshold(input_image)
    %set the size of the image
    [height, width, numcolors]=size(input_image);

    %ridler calvard algorithm to get the threshold
    iterations = 100; %total iterations to run to be sure threshold is optimal
    tol = 1e-6;
    imgEq = input_image(:);
    ii = 1;
    thresh(ii) = mean(imgEq);
    while ii<iterations
        imgGrey = input_image>thresh(ii);
        mbt = mean(imgEq(~imgGrey));
        mat = mean(imgEq(imgGrey));
        thresh(ii+1) = 0.5*(mbt + mat);
        if thresh(ii+1) - thresh(ii) > tol
            ii = ii + 1;
        else
            break
            1;end;1;end
    level = thresh(end);%end threshold to use for doule thresh

    %intialiaze the threshold image arrays
    hi_thresh=double(input_image);
    lo_thresh=double(input_image);
    double_thresh=zeros(height,width);

    tlo = .8*level;%tlo from ridler calvard
    thi = 1.3*level; %thi from halfway between tlo and the max level


        %create the histogram
        for imgGrey=1:height
            for j=1:width

                if input_image(imgGrey,j)>tlo
                    lo_thresh(imgGrey,j) = 255; 
                else
                    lo_thresh(imgGrey,j) = 0;
                end

                if input_image(imgGrey,j)>thi
                    hi_thresh(imgGrey,j) = 255; 
                else
                    hi_thresh(imgGrey,j) = 0;
                end


            end
        end
      % figure, imshow(lo_thresh);
      % figure, imshow(hi_thresh);


    frontierx=[];
    frontiery=[];

    %take the image and start the ouptut floodfill
        for imgGrey=1:height
            for j=1:width

              if hi_thresh(imgGrey,j) == 255





            old_color = lo_thresh(imgGrey,j);

            %initialize out frontiers to hold our neighbors
            frontierx = [frontierx imgGrey];
            frontiery = [frontiery j];
            %update the new image


            while length(frontierx) > 0 && length(frontiery) > 0


                qx = frontierx(length(frontierx));%copy last x
                frontierx(length(frontierx))=[];%pop x
                qy = frontiery(length(frontiery));%copy last y
                frontiery(length(frontiery))=[];%pop y
                %upadate the frontier and the neighbors fo the pixel need to
                %check both the input image and the output image
            if (qx+1 <height && qy+1< width)
                qx;
                qy;
                if lo_thresh(qx+1,qy+1) == old_color && double_thresh(qx+1,qy+1) ~= 255
                    frontierx = [frontierx qx+1];
                    frontiery = [frontiery qy+1];
                    double_thresh(qx+1,qy+1) = 255;
                end
            end
            if (qx+1 < height)
                lo_thresh(qx+1,qy);
                if lo_thresh(qx+1,qy) == old_color&& double_thresh(qx+1,qy) ~= 255
                    frontierx = [frontierx qx+1];
                    frontiery = [frontiery qy];
                    double_thresh(qx+1,qy) = 255;
                end
            end
            if (qx+1 < height && qy-1>0)
                lo_thresh(qx+1,qy-1);
                if lo_thresh(qx+1,qy-1) == old_color&& double_thresh(qx+1,qy-1) ~= 255
                    frontierx = [frontierx qx+1];
                    frontiery = [frontiery qy-1];
                    double_thresh(qx+1,qy-1) = 255;
                end
            end
            if (qy-1>0)
                lo_thresh(qx,qy-1);
                if lo_thresh(qx,qy-1) == old_color&& double_thresh(qx,qy-1) ~= 255
                    frontierx = [frontierx qx];
                    frontiery = [frontiery qy-1];
                    double_thresh(qx,qy-1) = 255;
                end
            end
            if (qx-1>0 && qy-1>0)
                lo_thresh(qx-1,qy-1);
                if lo_thresh(qx-1,qy-1) == old_color&& double_thresh(qx-1,qy-1) ~= 255
                    frontierx = [frontierx qx-1];
                    frontiery = [frontiery qy-1];
                    double_thresh(qx-1,qy-1) = 255;
                end
            end
            if (qx-1>0)
                lo_thresh(qx-1,qy);
                if lo_thresh(qx-1,qy) == old_color&& double_thresh(qx-1,qy) ~= 255
                    frontierx = [frontierx qx-1];
                    frontiery = [frontiery qy];
                    double_thresh(qx-1,qy) = 255;
                end
            end
            if(qx-1 > 0 && qy+1 <= width)
                lo_thresh(qx-1,qy+1);
                if lo_thresh(qx-1,qy+1) == old_color&& double_thresh(qx-1,qy+1) ~= 255
                    frontierx = [frontierx qx-1];
                    frontiery = [frontiery qy+1];
                    double_thresh(qx-1,qy+1) = 255;
                end
            end
            if(qy+1 <= width)
                lo_thresh(qx,qy+1);
                if lo_thresh(qx,qy+1) == old_color&& double_thresh(qx,qy+1) ~= 255
                    frontierx = [frontierx qx];
                    frontiery = [frontiery qy+1];
                    double_thresh(qx,qy+1) = 255;
                end
            end


            end
              end


            end
        end
       %program finishesa and diplays the image 
    %figure; imshow(uint8(double_thresh));
    %title('Threshold Image');

   % ImageOut= uint8(double_thresh);
   % imwrite(ImageOut, 'double_thresh.bmp');
    
end
