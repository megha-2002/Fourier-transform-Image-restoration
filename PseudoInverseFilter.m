%pseudo inverse filter
h = fspecial('disk',4);
% Read image and convert to double for FFT
cam = im2double(imread('images (3).jpg'));
hf = fft2(h,size(cam,1),size(cam,2));
cam_blur = real(ifft2(hf.*fft2(cam)));
imshow(cam_blur),title('blured image')

sigma_u = 10^(-40/20)*abs(1-0);
cam_blur_noise = cam_blur + sigma_u*randn(size(cam_blur));
imshow(cam_blur_noise),title('blured image with noise')

cam_inv = real(ifft2(fft2(cam_blur_noise)./hf));
imshow(cam_inv),title('PSF FFT magnitude')

hf_abs = abs(hf);

shading interp, camlight, colormap jet

cam_pinv = real(ifft2((abs(hf) > 0.1).*fft2(cam_blur_noise)./hf));
imshow(cam_pinv),title('pseudo-inverse restoration')

cam_pinv2 = real(ifft2(fft2(cam_blur_noise).*conj(hf)./(abs(hf).^2 + 1e-2)));
imshow(cam_pinv2),title('alternative pseudo-inverse restoration')