                    %% EXPERIMENT 3: IMAGE ENHANCEMENT
%%
clear all;
clc;
%% Negative of an image
figure()
A=imread('C:\Users\hp\Downloads\DIPL2_image.png');
C = rgb2gray(A);
D = 255 -C;
imshowpair(C,D, "montage")

%% n>1(Enhancing the brighter pixels)

E = imread("C:\Users\hp\Downloads\leaf_lateblight.jpg");
F = im2gray(E);
G = im2double(F);%We have scaled the intensity values from 0-255 to 0-1 so that we can take the power of the image.
I1 = G.^3;
I2 = G.^5;
I3 = G.^7;
figure()
sgtitle("Enhancing the brighter pixels")
subplot(2,2,1);
imshow(G)
title("Original image- G")
subplot(2,2,2)
imshow(I1)
title("Case 1: I1 = G^3")
subplot(2,2,3)
imshow(I2)
title("Case 2: I2 = G^5")
subplot(2,2,4)
imshow(I3)
title("Case 3: I3 = G^7")
%I2 = im2double(I) converts the image I to double precision.


%% n<1(Enhancing the darker pixels)

H = imread("Brain_tumour_image.jpg");
J = im2gray(H);
K = im2double(J);
I4 = K.^0.2;
I5 = K.^0.5;
I6 = K.^0.7;
figure()
sgtitle("Enhancing the darker pixels")
subplot(2,2,1)
imshow(K)
title("Original image- K")
subplot(2,2,2)
imshow(I4)
title("Case 1: I4 = K^0.2;")
subplot(2,2,3)
imshow(I5) 
title("Case 2: I5 = K^0.5")
subplot(2,2,4)
imshow(I6)
title("Case 3: I6 = K^0.7")
