%% *EXPERIMENT-8: Low pass and High pass filter* 

%% Low pass filter
input_img1=imread('heart_image.png');
input_img=rgb2gray(input_img1);

[M,N]=size(input_img);
FT=fft2(double(input_img));

D0=10;

u=0:(M-1);
idx=find(u>M/2);
u(idx)=u(idx)-M;
v=0:(N-1);
idy=find(v>N/2);
v(idy)=v(idy)-N;

[V,U]=meshgrid(v,u);

D=sqrt(U.^2+V.^2);
H=double(D<=D0);
G=H.*FT;
output_img=real(ifft2(double(G)));
subplot(1,2,1);
imshow(input_img);
subplot(1,2,2);
imshow(mat2gray(output_img));

%% High Pass filter

input_img1 = imread('heart_image.png');
input_img = rgb2gray(input_img1);

[M, N] = size(input_img);
FT = fft2(double(input_img));

D0 = 10;

u = 0:(M-1);
idx = find(u > M/2);
u(idx) = u(idx) - M;
v = 0:(N-1);
idy = find(v > N/2);
v(idy) = v(idy) - N;

[V, U] = meshgrid(v, u);

D = sqrt(U.^2 + V.^2);
H = double(D > D0);  % High pass filter: set frequencies above D0 to 1
G = H .* FT;
output_img = real(ifft2(double(G)));

subplot(1,2, 1);
imshow(input_img);
subplot(1, 2, 2);
imshow(mat2gray(output_img));
