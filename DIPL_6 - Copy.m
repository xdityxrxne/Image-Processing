% A = [1 2 3 4];
% % Compute the 1-D Fourier transform of each row
% B = fft(A,[],2);
% % Display the result
% disp(B);
% 
% C = [1 8 7 2]; 
% D= [9 8 4 9]; 
% E = [1 1 3 8];
% F = [3 3 7 0];
% 
% fft_C = fft(C,[],2);
% fft_D = fft(D,[],2);
% fft_E = fft(E,[],2);
% fft_F = fft(F,[],2);
% 
% disp(fft_C);


%% 
% Read in an image
img_clr = imread('heartimage.png');
% Convert the image to grayscale, if necessary
img = rgb2gray(img_clr);
subplot(2,2,1)
imshow(img);
title("Original Image")

% Take the Fourier transform of the image
img_fft = fft2(img);
img_fft_shift = fftshift(img_fft);
img_fft_mag = abs(img_fft_shift);
subplot(2,2,2)
imshow(log(1 + img_fft_mag), []);
title("Magnitude plot of frequency Spectrum")

% Shift the zero frequency component to the center of the spectrum
img_fft_shifted = fftshift(img_fft);
% Display the magnitude of the Fourier transform
img_fft_phase = angle(img_fft_shifted);
O = min(img_fft_mag);
P = max(img_fft_mag);
%disp(O);
%disp(P);
subplot(2,2,3)
imshow(img_fft_phase, []);
title('Phase plot of frequecy spectrum')
%%

img_fft = fft2(img);
img_fft_shift = fftshift(img_fft);
img_fft_mag = abs(img_fft_shift);
img_fft_phase = angle(img_fft_shift);
subplot(1, 2, 1);
imshow(log(1 + img_fft_mag), []);
title('Magnitude of Fourier Transform');
subplot(1, 2, 2);
imshow(img_fft_phase, []);
title('Phase of Fourier Transform');
%the white spot was on top right and we bought it to centre using fft shift
%%
img_clr = imread('blackdot.png');
% Convert the image to grayscale, if necessary
img = rgb2gray(img_clr);
subplot(2,2,1)
imshow(img);
title("Original Image")

% Take the Fourier transform of the image
img_fft = fft2(img);
img_fft_shift = fftshift(img_fft);
img_fft_mag = abs(img_fft_shift);
subplot(2,2,2)
imshow(log(1 + img_fft_mag), []);
title("Fourier Transform Magnitude Plot")


img_fft = fft2(img);
img_fft_shift = fftshift(img_fft);
img_fft_phase = angle(img_fft_shift);
subplot(2,2,3)
imshow(log(1 + img_fft_phase), []);
title("Fourier Transform Phase Plot")

%Taking inverse fourier transform(Retrieved Image)
img_ifft = ifft2(img_fft);
subplot(2,2,4)
imshow(img_ifft, []);
title("Retrieved Image")
%%
%Taking inverse fourier transform(only magnitude)
figure()
img_ifft = ifft2(img_fft_mag);
subplot(1,2,1)
imshow(img_ifft, []);
title("Only Magnitude is Retrieved")

%Taking inverse fourier transform(only phase)
img_ifft = ifft2(img_fft_phase);
subplot(1,2,2)
imshow(img_ifft, []);
title("Only Phase is Retrieved")