 %% EXPERIMENT-10: *Noise* 


 %% Unit Masks(Smoothing Masks)
figure(1)
clear
A = imread("heart_image.png");
B = im2gray(A);
subplot(2,2,1)
imshow(B);
title("Original Image")

M1 = ones(3);
C1 = conv2(double(B),M1/9,'same');
subplot(2,2,2)
C1 = uint8(C1);
imshow(C1)
title("Image with 3x3 mask")

% M2 = ones(5)
% C2 = conv2(double(B),M2/sum(sum(ones(5))),'same');
% subplot(2,2,3)
% title("Image with mask")
% C2 = uint8(C2);
% imshow(C2)
% title("Image with 5x5 mask")w

M3 = ones(10);
C3 = conv2(double(B),M3/sum(sum(ones(10))),'same');
subplot(2,2,3)
title("Image with mask")
C3 = uint8(C3);
imshow(C3)
title("Image with 10x10 mask")

M4 = ones(15);
C4 = conv2(double(B),M4/sum(sum(ones(15))),'same');
subplot(2,2,4)
title("Image with mask");
C4 = uint8(C4);
imshow(C4)
title("Image with 15x15 mask")
%image becomes more chaotic
%%
figure(2)
C = imnoise(B,'gaussian',0.1);
subplot(3,2,1)
imshow(B) 
title("Original Image")
subplot(3,2,2)
imshow(C)
title("Original Image with noise")

N1 = imnoise(C1,'gaussian',0.1);
subplot(3,2,3)
imshow(N1) 
title("Masked Image with noise (Mask1)")

N2 = imnoise(C3,'gaussian',0.1);
subplot(3,2,4)
imshow(N2) 
title("Masked Image with noise (Mask2)")

N3 = imnoise(C4,'gaussian',0.1);
subplot(3,2,5)
imshow(N3) 
title("Masked Image with noise (Mask3)")

%%
figure(3)
N4 = imnoise(C4,'gaussian',0.1);
subplot(2,2,1)
imshow(C4) 
title("Masked Image")

subplot(2,2,2)
imshow(N4)
title("Original Image with noise - 0.1")

N5 = imnoise(C4,'gaussian',0.2);
subplot(2,2,3)
imshow(N5)
title("Original Image with noise - 0.2")

N6 = imnoise(C4,'gaussian',0.3);
subplot(2,2,4)
imshow(N6)
title("Original Image with noise - 0.3")

%%
figure(4)
N4 = imnoise(B,'salt & pepper',0.1);
subplot(2,2,1)
imshow(C4) 
title("Masked Image")

subplot(2,2,2)
imshow(N4)
title("Original Image with noise - 0.1")

N5 = imnoise(B,'salt & pepper',0.2);
subplot(2,2,3)
imshow(N5)
title("Original Image with noise - 0.2")

N6 = imnoise(B,'salt & pepper',0.3);
subplot(2,2,4)
imshow(N6)
title("Original Image with noise - 0.3")
%Convolution wont work for salt and pepper as it is non linear. Salt and
%pepper is a multiplicative noise.
%Either we want to remove 255 or 0.
%Take the neighbourhood pixels and arrange them in ascending or descending.
%Take the median of the pixels.



%%
subplot(1,2,1)
imshow(C)
title('Image with Gaussian Noise')
g = medfilt2(C,[6,6]);
subplot(1,2,2)
imshow(g)
title('Denoised Image')
%%
subplot(1,2,1)
imshow(N6)
title('Image with Salt and Pepper Noise')
f = medfilt2(N6,[6,6]);
subplot(1,2,2)
imshow(f)
title('Denoised Image')