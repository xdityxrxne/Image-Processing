 %% EXPERIMENT-5: EXPLORING THE EFFECTS OF DIFFERENT MASKS ON AN IMAGE

%%
%% Unit Masks(Smoothing Masks)
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
% title("Image with 5x5 mask")

M3 = ones(10)
C3 = conv2(double(B),M3/sum(sum(ones(10))),'same');
subplot(2,2,3)
title("Image with mask")
C3 = uint8(C3);
imshow(C3)
title("Image with 10x10 mask")

M4 = ones(15)
C4 = conv2(double(B),M4/sum(sum(ones(15))),'same');
subplot(2,2,4)
title("Image with mask")
C4 = uint8(C4);
imshow(C4)
title("Image with 15x15 mask")
%image becomes more chaotic
%%
%% Edge Detecting masks

figure()
A = imread("chess.png");
B = im2gray(A);
subplot(2,3,1)
imshow(B);
title("Original Image")

mask1 = [1 0 -1; 1 0 -1; 1 0 -1];
D = conv2(double(B),mask1,'same');
D = uint8(D);
subplot(2,3,2)
imshow(D)
title("Image with mask 1")

mask2 = [1 1 1 ; 0 0 0; -1 -1 -1];
D = conv2(double(B),mask2,'same');
D = uint8(D);
subplot(2,3,3)
imshow(D)
title("Image with mask 2")

mask3 = [1 2 1 ; 0 0 0; -1 2 -1];
D = conv2(double(B),mask3,'same');
D = uint8(D);
subplot(2,3,4)
imshow(D)
title("Image with mask 3")

mask4 = [1 0 -1 ; 2 0 -2; 1 0 -1];
D = conv2(double(B),mask4,'same');
D = uint8(D);
subplot(2,3,5)
imshow(D)
title("Image with mask 4")