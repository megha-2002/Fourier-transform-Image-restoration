%bilateral gaussian filter
I = imread('images (1).jpg');
imshow(I), title('Original image');
patch = imcrop(I,[170, 35, 50 50]);
imshow(patch)
patchVar = std2(patch)^2;
DoS = 2*patchVar;J = imbilatfilt(I,DoS);
imshow(J),title(['Degree of Smoothing: ',num2str(DoS)])
K = imbilatfilt(I,DoS,2);
imshow(K),title(['Degree of Smoothing: ',num2str(DoS),', Spatial Sigma: 2'])
