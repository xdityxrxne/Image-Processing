%% Experiment - 7: Magnitude and Phase swapping


clc
clear all
a1=imread('lawn.png');
a2=imread('heartimage.png');
a1=im2gray(a1);
a2=im2gray(a2);
[M N]=size(a1);
a2=imresize(a2,[M N]);
b=fft2(a1);
c=fft2(a2);
bmag=abs(b);
bphase=angle(b);
cmag=abs(c);
cphase=angle(c);
[r1 t1]=pol2cart(bphase,bmag);
[r2 t2]=pol2cart(cphase,cmag);
z1=r1+i*t1;
z2=r2+i*t2;
z3=r1+i*t2;
z4=r2+i*t1;
r11=ifft2(z1);
r22=ifft2(z2);
r12=ifft2(z3);
r21=ifft2(z4);
%Image 1
m1 = abs(r11);
subplot(2,2,1);
imshow(mat2gray(m1))
title('Image 1')
%Image 2
m2 = abs(r22);
subplot(2,2,2)
imshow(mat2gray(m2))
title('Image 2')

%Magnitude of Image 2 and Phase of Image 1
m3 = abs(r12);
subplot(2,2,3)
imshow(mat2gray(m3))
title('Mag of Image 2 and Phase of Image 1')

%Magnitude of Image 1 and Phase of Image 2 
m4 = abs(r21);
subplot(2,2,4)
imshow(mat2gray(m4))
title('Mag of Image 1 and Phase of Image 2')