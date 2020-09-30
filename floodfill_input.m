function input_image = floodfill_input(input_image, x, y, RGB)

%inputs are the input image the x,y coordinate of the seedpoint 
%RGB is the new color that we wnat to fill to

%set the size of the image
[height, width, numcolors]=size(input_image);

%option to have the user input the color and the location
%{
prompt = 'What do you want the new red value to be? ';
r = input(prompt)
prompt = 'What do you want the new green value to be? ';
g = input(prompt)
prompt = 'What do you want the new blue value to be? ';
b = input(prompt)

if r>256
    r=256;
elseif b>256
    b=256;
elseif g>256
    g=256;
elseif r<0
    r=0;
elseif b<0
    b=0;
elseif g<0
    g=0;
end
prompt = 'What is the x coordinate to start at? ';
x = input(prompt)
prompt = 'What is the y coordinate to start at? ';
y = input(prompt)
%}

frontierx=[];
frontiery=[];

%seed point where we are going to start

%new RGB values


%input_image = Floodfill(x,y,RGB,input_image)



%we want to make sure we adjust all of the images
    for k=1:numcolors
%set the old color so that we can identify what color to get rid of
        old_color = input_image(x,y,k);
        if old_color == k
            return
        end
%initialize out frontiers(stack) that we use to know where we are
        frontierx = [frontierx x];
        frontiery = [frontiery y];
        
        %adjust the starting point
        if k == 1
            input_image(x,y,k) = RGB(k);
        elseif k == 2
            input_image(x,y,k) = RGB(k);
        else
            input_image(x,y,k) = RGB(k);
        end
        
        %main loop to complete the floodfill
        while length(frontierx) > 0 && length(frontiery) > 0
               %{
            neighbors(1) = img(r-1,c-1); % Upper left.  r = row, c = column.
            neighbors(2) = img(r-1,c); % Upper middle.  r = row, c = column.
            neighbors(3) = img(r-1,c+1); % Upper right.  r = row, c = column.
            neighbors(4) = img(r,c-1); % left.  r = row, c = column.
            neighbors(5) = img(r,c+1); % right. r = row, c = column.
            neighbors(6) = img(r+1,c+1); % Lowerleft.  r = row, c = column.
            neighbors(7) = img(r+1,c); % lower middle.  r = row, c = column.
            neighbors(8) = img(r+1,c-1); % Lower left.  r = row, c = column.
            %}
            
            qx = frontierx(length(frontierx));%copy last x
            frontierx(length(frontierx))=[];%pop x
            qy = frontiery(length(frontiery));%copy last y
            frontiery(length(frontiery))=[];%pop y
            %the folowing loos at the neighbors and updates the frontiers
            %and the pixel color
        if (qx+1 <height && qy+1<=width)
            if input_image(qx+1,qy+1,k) == old_color
                frontierx = [frontierx qx+1];
                frontiery = [frontiery qy+1];
                input_image(qx+1,qy+1,k) = RGB(k);
            end
        end
        if (qx+1 < height)
            input_image(qx+1,qy,k);
            if input_image(qx+1,qy,k) == old_color
                frontierx = [frontierx qx+1];
                frontiery = [frontiery qy];
                input_image(qx+1,qy,k) = RGB(k);
            end
        end
        if (qx+1 < height && qy-1>0)
            input_image(qx+1,qy-1,k);
            if input_image(qx+1,qy-1,k) == old_color
                frontierx = [frontierx qx+1];
                frontiery = [frontiery qy-1];
                input_image(qx+1,qy-1,k) = RGB(k);
            end
        end
        if (qy-1>0)
            input_image(qx,qy-1,k);
            if input_image(qx,qy-1,k) == old_color
                frontierx = [frontierx qx];
                frontiery = [frontiery qy-1];
                input_image(qx,qy-1,k) = RGB(k);
            end
        end
        if (qx-1>0 && qy-1>0)
            input_image(qx-1,qy-1,k);
            if input_image(qx-1,qy-1,k) == old_color
                frontierx = [frontierx qx-1];
                frontiery = [frontiery qy-1];
                input_image(qx-1,qy-1,k) = RGB(k);
            end
        end
        if (qx-1>0)
            input_image(qx-1,qy,k);
            if input_image(qx-1,qy,k) == old_color
                frontierx = [frontierx qx-1];
                frontiery = [frontiery qy];
                input_image(qx-1,qy,k) = RGB(k);
            end
        end
        if(qx-1 > 0 && qy+1 <= width)
            input_image(qx-1,qy+1,k);
            if input_image(qx-1,qy+1,k) == old_color
                frontierx = [frontierx qx-1];
                frontiery = [frontiery qy+1];
                input_image(qx-1,qy+1,k) = RGB(k);
            end
        end
        if(qy+1 <= width)
            input_image(qx,qy+1,k);
            if input_image(qx,qy+1,k) == old_color
                frontierx = [frontierx qx];
                frontiery = [frontiery qy+1];
                input_image(qx,qy+1,k) = RGB(k);
            end
        end
            
            
        end
        

    end
ImageOut= uint8(input_image);
%imwrite(ImageOut, FileName);
imshow(input_image)%show the output
%input_image shuld now be updated

   