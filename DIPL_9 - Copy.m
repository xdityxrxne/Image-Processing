%% *EXPERIMENT-9: Image Thresholding* 

%% Edge Detecting masks

figure()
A = imread("lungs.jpeg");
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
E = conv2(double(B),mask2,'same');
E = uint8(E);
subplot(2,3,3)
imshow(E)
title("Image with mask 2")

mask3 = [1 2 1 ; 0 0 0; -1 -2 -1];
F = conv2(double(B),mask3,'same');
F = uint8(F);
subplot(2,3,4)
imshow(F)
title("Image with mask 3")

mask4 = [1 0 -1 ; 2 0 -2; 1 0 -1];
G = conv2(double(B),mask4,'same');
G = uint8(G);
subplot(2,3,5)
imshow(G)
title("Image with mask 4")


%whatever o/p image we are getting is a grayscale image we have to convert
%it to binary.
%%
figure(1)
D_b = imbinarize(D,0.3);
subplot(2,2,1)
imshow(D_b)
title("Threshold = 0.3")

D_b = imbinarize(D,0.5);
subplot(2,2,2)
imshow(D_b)
title("Threshold = 0.5")

D_b = imbinarize(D,0.8);
subplot(2,2,3)
imshow(D_b)
title("Threshold = 0.8")

%%

figure(2)
D_b = imbinarize(D,0.3);
subplot(2,3,1)
imshow(D_b)
title("(Mask1)Threshold = 0.3")

E_b = imbinarize(E,0.3);
subplot(2,3,2)
imshow(E_b)
title("(Mask2)Threshold = 0.3")


F_b = imbinarize(F,0.3);
subplot(2,3,3)
imshow(F_b)
title("(Mask3)Threshold = 0.3")

G_b = imbinarize(G,0.3);
subplot(2,3,4)
imshow(G_b)
title("(Mask4)Threshold = 0.3")

%%
figure(3)
imshow(D_b+E_b)

%What should be the threshold so that we get a realistic edge?
%% use the function edge
figure(4)
BW_sobel = edge(B,'sobel');
subplot(1,2,1)
imshow(BW_sobel)
title("Sobel filter")
BW_canny = edge(B,'canny');
subplot(1,2,2)
imshow(BW_canny)
title("Canny filter")