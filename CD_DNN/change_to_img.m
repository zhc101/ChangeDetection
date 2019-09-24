%%
%再用预测出的labels重构出一个预测二值图片test_y
data1=load('labels1.mat');
labels=data1.labels;
data2=load('testYellow_x.mat');
test_x=data2.test_x;
test_x(1,:)=[];
img=imread('C:/Users/HAOCHENG/Desktop/DBN代码解析（注释）/example/Yellow River I-SAR/im1.bmp');
[rows cols]=size(img);
for i=1:rows
    for j=1:cols
        img(i,j)=0;
    end
end
count=1;
c1=0;
for ii=3:rows-2
    for jj=3:cols-2
        if(labels(count)==1)
            img(ii,jj)=255;
            c1=c1+1;
        end
        count=count+1;
    end
end
c=0;
for i=1:rows
    for j=1:cols
        if(img(i,j)==255)
            c=c+1;
        end
    end
end
imshow(img);


