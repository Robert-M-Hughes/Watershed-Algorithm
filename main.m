close all 
clear all
clc

%open up the pathway to file and set as the input

[FileName, FilePath] = uigetfile('*');
input_image = imread(strcat(FilePath,FileName));
[height, width]=size(input_image);

%% Part 1 Normal Watershed
input_image = double(input_image);
%get the magnitude Image
[magWater, gradient] = MagnitudeGradient(input_image);
%display the threshold Image
figure; imshow((magWater));
title('Normal Watershed: Magnitude')
wtrShd = watershed(magWater);
figure;imshow(uint8(255*wtrShd/(max(max(wtrShd)))));
title('Normal Watershed: Labels');

%% Part 2 Watershed with Segmentation
% clear the variable so the watershed will run corretly
clearvars -except input_image

%call the function to complete the marker based watershed
watershedMarkerSetup(input_image)




