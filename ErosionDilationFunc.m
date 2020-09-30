function out = ErosionDilationFunc(input_image)



out = dilation(input_image);

out = erosion(out);
out = erosion(out);
out = erosion(out);

out = dilation(out);
out = dilation(out);
out = dilation(out);
figure; imshow(out);
title('Cleaned Image');
end