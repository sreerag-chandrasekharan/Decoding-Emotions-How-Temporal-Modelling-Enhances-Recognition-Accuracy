clc;
clear;
y = categorical([]);
load("Model_1_netwotk_LSTM.mat");
load("newdata.mat");
%% 
for i = 1:length(imgArray)
montage(imgArray)
[YPred,s] = classify(netTransfer,imgArray{i});
disp(YPred)
map{i} = gradCAM(netTransfer,imgArray{i},YPred);
y(i) = nominal(YPred);
S(i,:) = s;
end
%% classify and display
classname = netTransfer.Layers(end, 1).Classes;
idx = randperm(numel(imgArray),4);
% display image
figure
for j = 1:4
    subplot(2,2,j)
    imshow(imgArray{1, idx(j)})
    label = y(idx(j));
    top2 = maxk(S(idx(j),:),2);
    title([string(label)+ " "+ num2str(round(top2(1)*100,2))+ " % " + ...
        string(classname(top2(2)== S(idx(j),:)))+ " "+ num2str(round(top2(2)*100,2))+ " %"]);

end

%% display GRAD_CAM
figure
for j = 1:4
    subplot(2,2,j)
    imshow(imgArray{1, idx(j)})
    hold on;
    imagesc(map{1, idx(j)},'AlphaData',0.5);
    colormap jet
    hold off;
    title("Grad-CAM")
    label = y(idx(j));
    top2 = maxk(S(idx(j),:),2);
    title([string(label)+ " "+ num2str(round(top2(1)*100,2))+ " % " + ...
        string(classname(top2(2)== S(idx(j),:)))+ " "+ num2str(round(top2(2)*100,2))+ " %"]);

end
% %% GC
% 
% figure
% imshow(img);
% hold on;
% imagesc(map,'AlphaData',0.5);
% colormap jet
% hold off;
% title("Grad-CAM");
% %% boxplot
% figure
% boxplot(S,classname)