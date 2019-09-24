%%包含数据读取及预处理，预处理工作包括RGB转为灰度图像，选择合适的训练数据点，以便之后，再将其拉成向量以投入网络中进行预训练。

clc;
clear all;
%%
% %%以Bern-SAR图片为例
BernSAR_im1=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Bern-SAR/im1.bmp');
BernSAR_im1=rgb2gray(BernSAR_im1);
BernSAR_im2=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Bern-SAR/im2.bmp');
BernSAR_im2=rgb2gray(BernSAR_im2);
% %BernSAR_im3=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Bern-SAR/im3.bmp');
% %BernSAR_im3=rgb2gray(BernSAR_im3);%groundtruth
% BernSAR_changed_map=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Bern-SAR/changed_map.bmp');
% BernSAR_changed_map=rgb2gray(BernSAR_changed_map);%传统方法得到的结果
% %PS:有1210个点为值255，即变化点
%%
%%Ottawa-SAR
%%
OttawaSAR_im1=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Ottawa-SAR/im1.bmp');
OttawaSAR_im1=rgb2gray(OttawaSAR_im1);
OttawaSAR_im2=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Ottawa-SAR/im2.bmp');
OttawaSAR_im2=rgb2gray(OttawaSAR_im2);
OttawaSAR_changed_map=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Ottawa-SAR/changed_map.bmp');
OttawaSAR_changed_map=rgb2gray(OttawaSAR_changed_map);%传统方法得到的结果
%%
%%Yellow_River
Yellow_River_im1=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Yellow River I-SAR/im1.bmp');
Yellow_River_im2=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Yellow River I-SAR/im2.bmp');



%vec_BernSAR_im1 = reshape(BernSAR_im1,1,size(BernSAR_im1,1)*size(BernSAR_im1,2));
%save('vec.mat','vec_BernSAR_im1');
figure(1);
subplot(2,2,1);imshow(OttawaSAR_im1);
title('BernSAR-im1');
subplot(2,2,2);imshow(OttawaSAR_im2);
title('BernSAR-im2');
%subplot(2,2,3);imshow(BernSAR_im3);
%title('BernSAR-im3');

subplot(2,2,3);imshow(OttawaSAR_changed_map);
title('BernSAR-changed-map');
%%接着选择合适的样本点
check=choose_Sample(OttawaSAR_changed_map);
subplot(2,2,4);imshow(check);
title('BernSAR-changed-map1');











