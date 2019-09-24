%DBN前预处理，主要是构造合适的测试集和训练集
%归一化
im1=double(Yellow_River_im1)/255;
im2=double(Yellow_River_im2)/255;

[rows cols]=size(Yellow_River_im2);
n=3;

train_x=zeros(1,2*n*n);
test_x=zeros(1,2*n*n);
for i=3:rows-2
    for j=3:cols-2
        %if(check(i,j)==255)
           vec_im1=zeros(1,n*n);
           vec_im2=zeros(1,n*n);
           cc=1;
           for ii=-(n-1)/2:(n-1)/2
                for jj=-(n-1)/2:(n-1)/2
                   vec_im1(1,cc)=im1(i+ii,j+jj);
                   vec_im2(1,cc)=im2(i+ii,j+jj);
                   cc=cc+1;
                end
           end
           vec_im=[vec_im1,vec_im2];
           %train_x=[train_x;vec_im];
           test_x=[test_x;vec_im];
       % else        
       % end 
    end
end
save('testYellow_x.mat','test_x');


%train_y
% train_y=zeros(c,1);
% cc=1;
% for i=3:rows-2
%     for j=3:cols-2
%         if(check(i,j)==255)
%             if(OttawaSAR_changed_map(i,j)==0)
%                 
%                 train_y(cc,1)=0;
%                  train_y(cc,1)=0;%第一列为0代表此点未变化
%                  train_y(cc,2)=1;%第二列为1代表此点未变化
%             else
%                 train_y(cc,1)=1;
%                  train_y(cc,1)=1;%第一列为1代表此点变化
%                  train_y(cc,2)=0;%第二列为0代表此点变化  
%             end
%             cc=cc+1;
%         else        
%             
%         end 
%         
%     end
% end
% 
% 
% count=0;
% for k=1:89506
%     if(train_y(k)==1)
%         count=count+1;
%     end
% end
% save('trainOttawaSAR_y1.mat','train_y');


