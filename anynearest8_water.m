function [val, xnew, ynew] = anynearest8(temp_label, magnitude, x, y, gray)

[height, width] = size(temp_label);

for i = -1:1
    for j = -1:1
        if x+i <= height && x+i > 0 && y+j <= width && y+j > 0
           if((temp_label(x+i, y+j) >= 0) && magnitude(x,y) == gray)
               val = 1;
               xnew = x+i;
               ynew = y+j;
               return;
           end
        end
    end
end
xnew = -1;
ynew = -1;
val = -1;


end

