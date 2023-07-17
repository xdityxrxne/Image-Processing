%% Morphological Image Processing

%%
A = imread("fingerprint.jpg");
B = im2gray(A);
C = imbinarize(B);
subplot(2,2,1)
imshow(A);
title("Original Image")
subplot(2,2,2)
imshow(B);
title("Grayscale Image")
subplot(2,2,3)
imshow(C);
title("Binary Image")
subplot(2,2,4)
D = 1-C;
imshow(D)
title("Complement Binary Image")
%% Dilation

S1 = ones(3,3);
D1 = imdilate(D,S1);
subplot(2,2,1)
imshow(D1)
title("Dilated Image 1")
S2 = ones(9,9);
D2 = imdilate(D,S2);
subplot(2,2,2)
imshow(D2)
title("Dilated Image 2")
S3 = ones(12,12);
D3 = imdilate(D,S3);
subplot(2,2,3)
imshow(D3)
title("Dilated Image 3")

%% Erosion
figure()
E1 = imerode(D3,S1);
subplot(2,2,1)
imshow(E1)
title("Eroded Image 1")
E2 = imerode(D3,S2);
subplot(2,2,2)
imshow(E2)
title("Eroded Image 2")
E3 = imerode(D3,S3);
subplot(2,2,3)
imshow(E3)
title("Eroded Image 3")

%%
S4 = [0 0 1 0 0; 0 0 1 0 0; 1 1 1 1 1; 0 0 1 0 0; 0 0 1 0 0];
D4 = imdilate(D,S4);
subplot(1,2,1)
imshow(D4)
title("Dilation")
E4 = imerode(D4,S4);
subplot(1,2,2)
imshow(E4)
title("Erosion")

%% Closing and Opening
subplot(2,2,1)
imshow(D)
title("Original Image")
C1 = imerode(D4,S4);
subplot(2,2,2)
imshow(C1)
title('Closing')
O1 = imdilate(E4,S4);
subplot(2,2,3)
imshow(O1)
title('Opening')

%% Closing and Closing

subplot(1,2,1)
imshow(C1)
title("Closing")
D5 = imdilate(C1,S4);
C2 = imerode(D5,S4);
subplot(1,2,2)
imshow(C2)
title('Closing and Closing')

%% Opening and Opening

subplot(1,2,1)
imshow(O1)
title("Opening")
E5 = imerode(O1,S4);
O2 = imdilate(E5,S4);
subplot(1,2,2)
imshow(O2)
title('Opening and Opening')
