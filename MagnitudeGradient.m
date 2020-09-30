function [gxy, iangle] = MagnitudeGradient(input_image)

[height, width] = size(input_image); % size of the image will be important to compute the iangle and the magnitude

sigma = .6;

[gaus, w] = Gaussian(sigma);
[Gder, wder] = Gaussian_Deriv(sigma);


Gder = flipud(Gder);
Gder = flip(Gder);

%horizontal intensity
temp_horizontal = convolve(input_image, gaus');%vert guassian
horizontal = convolve(temp_horizontal, Gder);
%{ 
------Used to compare my function to the matlab----------
figure; imshow(temp_horizontal);
title('Guas convolve')
a = conv2(input_image, gaus');
figure; imshow(uint8(a));
title('Matlab Gaus Convolve')
b = conv2(a, Gder);
figure; imshow(b)
title('Matlab Gaus Der');
%}
%figure; imshow((horizontal));
%title('Horizontal Gradient');

%vertical intensity

temp_vertical = convolve(input_image, gaus);
vertical = convolve(temp_vertical, Gder');
vertical = double(vertical);
horizontal = double(horizontal);
%figure; imshow(vertical);
%title('Vertical Gradient');

for i=1:height
    for j=1:width
        %GXY is the magnitude
        %Euclidean
        gxy(i,j) = sqrt(vertical(i,j) * vertical(i,j) + horizontal(i,j)*horizontal(i,j));
        %chessboard
        %gxy(i,j) = max(vertical(i,j), horizontal(i,j));
        
        %IANGLE is the gradient
        iangle(i,j) = atan2(horizontal(i,j), vertical(i,j));
    end
end
%figure; imshow(gxy);
%title('Magnitude Image')
%figure; imshow(iangle);
%title('Gradient Image')

end

