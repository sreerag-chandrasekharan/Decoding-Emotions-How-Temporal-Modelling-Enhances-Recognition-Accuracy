clc;
clear;

% load ("imgs_rs.mat","train_imgs");
load ("newdata.mat");
load ("Model_1_netwotk_LSTM.mat","netTransfer");
load("Oulu-Casia_Smaller_Face_Profile_Images_RGB.mat")
%% Code

inputSize = netTransfer.Layers(1).InputSize(1:2);
img = imgArray{4};


[classfn,score] = classify(netTransfer,img);
figure
imshow(img);
title(sprintf("%s (%.2f)", classfn, score(classfn)));

map = gradCAM(netTransfer,img,classfn);

%% display

figure
imshow(img);
hold on;
imagesc(map,'AlphaData',0.5);
colormap jet
hold off;
title("Grad-CAM");
