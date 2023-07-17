                    %% EXPERIMENT -2: BASICS OF IMAGE PROCESSING
%%

% Reading and displaying an image.
A=imread("C:\Users\hp\Downloads\DIPL2_image.png");
s=size(A);
s
subplot(1,3,1)
imshow(A)



% Resizing an image
B=imresize(A,[480,560]);
s2=size(B);
subplot(1,3,2)
imshow(B)

%Converting RGB to grayscale
C=rgb2gray(A);
s3=size(C);
subplot(1,3,3)
imshow(C)

%% Extract the individual red, green, and blue color channels.

Red=A(:,:,1);
figure()
subplot(1,4,1)
imshow(Red)
Green=A(:,:,2);
subplot(1,4,2)
imshow(Green)

Blue=A(:,:,3);
subplot(1,4,3)
imshow(Blue)

RGBcombine=cat(3,Red,Green,Blue);
subplot(1,4,4)
imshow(RGBcombine)

