%% EXPERIMENT 12: 2-D WAVELET TRANSFORM

%% Wavelet Analysis (Haar)
A = imread('lungs.jpeg');
B = im2gray(A);
imshow(B)
[a b c d] = dwt2(B,'Haar');
%%
subplot(2,2,1);
imshow(uint8(a));
title('Transformed Image');
subplot(2,2,2);
imshow(b);
title('Horizontal Detail subband');
subplot(2,2,3);
imshow(c);
title('Vertical Detail subband');
subplot(2,2,4);
imshow(d);
title('Diagonal Detail subband');

%% Inverse Wavelet Transform
y = idwt2(a,b,c,d, 'Haar');
figure()
imshow(uint8(y));

%% Displaying 1 subsignal at a time
ai = idwt2(a,[],[],[],'Haar');
subplot(2,2,1);
imshow(uint8(ai));
title('Only approximation');
bi = idwt2([],b,[],[],'Haar');
subplot(2,2,2);
imshow(bi);
title('Only Horizontal');
ci = idwt2([],[],c,[],'Haar');
subplot(2,2,3);
imshow(ci);
title('Only Vertical');
di = idwt2([],[],[],d,'Haar');
subplot(2,2,4);
imshow(di);
title("Only Diagonal");

%% Displaying combination of subsignals

bi_ci = idwt2([],b,c,[],'Haar');
subplot(2,2,1);
imshow(bi_ci);
title('Horizontal and Vetical')
ci_di = idwt2([],[],c,d,'Haar');
subplot(2,2,2);
imshow(ci_di);
title('Vertical and diagonal')
di_bi = idwt2([],b,[],d,'Haar');
subplot(2,2,3);
imshow(di_bi);
title("Horizontal and Diagonal")
%%
abc = idwt2(uint8(a),b,c,[],'Haar');
subplot(2,2,1);
imshow(uint8(abc))
title('a,b,c');
acd = idwt2(uint8(a),[],c,d,'Haar');
subplot(2,2,2);
imshow(uint8(acd))
title('a,c,d');
bcd = idwt2([],b,c,d,'Haar');
subplot(2,2,3);
imshow(bcd)
title("b,c,d");
%% Decompsing a decomposed image
figure()
a_2 = dwt2(a,'Haar');
imshow(uint8(a_2))
%%
figure()
[G] = [uint8(a) b;c d]; 
imshow(G)