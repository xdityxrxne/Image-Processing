            %% EXPERIMENT 4: EQUALIZED IMAGE AND HISTOGRAM EQUALIZATION 

clear all;
A = imread("C:\Users\hp\Downloads\heart_image.png");

%Grayscaling the image
A_GRAY = rgb2gray(A);

%Equalizing the image
B = histeq(A_GRAY);
sgtitle("EQUALIZED IMAGE AND HISTOGRAM EQUALIZATION")

subplot(2,2,1);
imshow(A_GRAY)
title("Original Image")

subplot(2,2,2);
imhist(A_GRAY)
title("PDF of the image")

subplot(2,2,3);
imshow(B)
title("Image with uniform intensities")

subplot(2,2,4);
imhist(B)
title("Uniform PDF of the image")
