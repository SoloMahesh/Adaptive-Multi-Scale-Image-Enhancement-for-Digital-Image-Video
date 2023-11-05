%% Model Assisted Multi-band Fusion for Single Image Enhancement and Applications to Robot Vision
% Initiation of project
clear;
close all;
save_name = 'output';
[filename, pathname] = uigetfile(...    
    {'*.PNG','Supported Files (*.jpg,*.img,*.tiff,)'; ...
    '*.PNG','PNG Files(*.bmp)'},...
    'MultiSelect', 'on');
im=imread(filename);%Read any colorimage 
img = im2double(im);
% img = im2double(imread('images/fattal/lviv_input.png'));
figure, 
imshow(img);
subplot(2,1,1),
imshow(img);
title('Original Image');
subplot(2,1,2),
imhist(img(:,:,1));
title('Histogram of Original image');
tic
[dehazed_img, comp_time, trans_map] = fcn_multi(img);
imwrite(dehazed_img, ['results/' save_name '.png']);
figure(3);
imshow([img dehazed_img]);
title('Enhancement result');
figure(4);

imshow(trans_map)
title('transmission map');
figure(5);
imagesc(trans_map);


imhist(dehazed_img);
title('HISTOGRAM OF OUTPUT IMAGE');
figure(6);
imshow(dehazed_img)
title('OUTPUT IMAGE');
% Meanenhanced = mean2(dehazed_img);
%  disp('Meanenhanced =')
%  disp(Meanenhanced)
%INPUT IMAGE PARAMETERS
Mean = mean2(img);
 disp('Mean =')
 disp(Mean)
Standard_Deviation = std2(img);
disp('Standard_Deviation = ');
disp(Standard_Deviation);
Entropy = entropy(img);
disp('Entropy =');
disp(Entropy);
RMS = mean2(rms(img));
disp('RMS =');
disp(RMS);
Variance = mean2(var(double(img)));
disp('Variance = ' );
disp(Variance );

% OUTPUT IMAGE PARAMETERS
OUTPUTMean = mean2(dehazed_img);
 disp('OUTPUTMean =')
 disp(OUTPUTMean)
OUTPUTStandard_Deviation = std2(dehazed_img);
disp('OUTPUTStandard_Deviation = ');
disp(OUTPUTStandard_Deviation);
OUTPUTEntropy = entropy(dehazed_img);
disp('OUTPUTEntropy =');
disp(OUTPUTEntropy);
OUTPUTRMS = mean2(rms(dehazed_img));
disp('OUTPUTRMS =');
disp(OUTPUTRMS);
OUTPUTVariance = mean2(var(double(dehazed_img)));
disp('OUTPUTVariance = ' );
disp(OUTPUTVariance );
toc