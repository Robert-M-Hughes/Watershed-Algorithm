function [edges] = edge_linking(hysteresis)

edges = hysteresis;
[height, width] = size(edges);

for i=1:height
    for j=1:width
        if(hysteresis(i,j) == 125)
            [true] = anynearest8(hysteresis, i, j);
            if(true == 1)
                edges(i,j) = 255;
            else
                edges(i,j) = 0;
            end
        end
    end
end
%figure; imshow(edges);
%title('Edges');

end

