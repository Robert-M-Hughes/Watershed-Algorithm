function watershedMarkerSetup(input_image)

%open up the pathway to file and set as the input

%[FileName, FilePath] = uigetfile('*');
%input_image = imread(strcat(FilePath,FileName));
[height, width]=size(input_image);

%get and compute the magnitude
input_image = double(input_image);
[magnitude, gradient] = MagnitudeGradient(input_image);
 figure; imshow(magnitude);
  magnitude = uint8(magnitude);
 title('Marker-Based Watershed: Magnitude');
 
 
thresh = double_threshold(input_image);
%thresh = ErosionDilationFunc(thresh);
diff= dilation(thresh);
diff=dilation(diff);
thresh = 255 - thresh;
diff = 255-diff;
figure; imshow(thresh);
title('Marker-Based Watershed: Threshold');


chamfer = Chamfer(thresh);
chamf_out = chamfer *(255/max(max(chamfer)));
figure; imshow(uint8(chamf_out));
title('Marker-Based Watershed: Chamfer');


watershed_out = watershed(chamf_out);
water = watershed_out *(255/max(max(watershed_out)));
figure; imshow(uint8(255*water/(max(max(water)))));
title('Marker-Based Watershed: Watershed on Chamfer');



edges = CannyEdge(water);
figure; imshow((edges));
title('Marker-Based Watershed: Edges of Watershed');


marker_input = zeros(height, width);
marker_input = diff+edges;

for i = 1:height
    for j = 1:width
       marker_input(1, j) = 0;
       marker_input(height, j) = 0;
       marker_input(i, 1) = 0;
       marker_input(i, width) = 0;
    end
end
figure; imshow(marker_input);
title('Marker-Based Watershed: Markers');


marker_input = uint8(marker_input);
[label,num_components] = watershedMarker(magnitude,marker_input);
figure; imshow(uint8(255*label/(max(max(label)))));
title('Marker-Based Watershed: Labels')



