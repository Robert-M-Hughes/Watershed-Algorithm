function [canny] = CannyEdge(input_image)

%numcolors = 3;
%imshow(input_image)
%title('input')
[height, width, numlayers]=size(input_image);

if numlayers == 3
    double_image= rgb2gray(input_image);
    double_image = double(double_image);
else
    double_image = double(input_image);
   % figure; imshow(double_image);
end

%title('Double Image');
[gxy, iangle] = MagnitudeGradient(double_image);
[suppressed] = NonMaxSuppression(gxy, iangle);
[hysteresis] = Hysteresis(suppressed);
[edges] = edge_linking(hysteresis);

canny = edges;


%edge_temp = getTemplate();

%chamfer_main = chamfer(edges);

%result = matching(edges, edge_temp);




 