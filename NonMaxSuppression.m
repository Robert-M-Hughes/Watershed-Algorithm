function [suppressed] = NonMaxSuppression(gxy, iangle)

[height, width] = size(gxy);
suppressed = gxy;
for i=1:height
    for j=1:width
        theta = iangle(i,j);
        if theta < 0
            theta = theta + pi;
        end
        theta = rad2deg(theta);
        if theta <= 22.5 || theta >157.5
            if i+1 < height && i-1 > 0
                if gxy(i,j) < gxy(i+1, j) || gxy(i,j) < gxy(i-1, j)
                    suppressed(i,j) = 0;
                end
            end
        elseif theta > 22.5 && theta <= 67.5
            if i -1 > 0 && j-1 > 0 && i+1 <=height && j+1 <= width
                if gxy(i,j) < gxy(i-1, j-1) || gxy(i,j) < gxy(i+1, j+1)
                    suppressed(i,j) = 0;
                end
            end
        elseif theta >= 67.5 && theta < 112.5
            if j +1 <= width && j-1 > 0
                if gxy(i,j) < gxy(i, j+1) || gxy(i,j) < gxy(i, j-1)
                    suppressed(i,j) = 0;
                end
            end
        elseif theta > 112.5 && theta <= 157.5
            if i -1 > 0 && j-1 > 0 && i+1 <=height && j+1 <= width
                if gxy(i,j) < gxy(i-1, j+1) || gxy(i,j) < gxy(i+1, j-1)
                    suppressed(i,j) = 0;
                end
            end
        end
    end
end
%figure; imshow(uint8(suppressed));
%title('supressed')

end

