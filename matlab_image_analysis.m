% Image analysis through MATLAB
% this software applies FFT and farfield corrections to the NDT x-ray
% images



im = imread('casting-x-rays\C0042_0002.png');



im_ft = fftshift(fft2(im)); %center fourier transform

%low pass circle filter
[yd,xd]=size(im); 
x=-xd./2:xd./2-1; 
y=-yd./2:yd./2-1;
[X,Y]=meshgrid(x,y); 

z=sqrt(X.^2 + Y.^2);
c= z < 60;
%c = fspecial('gaussian',[yd xd],10);
im_lp = im_ft.*c;

im_lpi = ifft2(im_lp);
f1 = abs(im_lpi);
fm = max(f1(:));
imshow(im_lpi/fm);
