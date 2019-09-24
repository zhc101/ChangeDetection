clear all;
data1=load('trainOttawaSAR_x.mat');
train_x=data1.train_x;
train_x(1,:)=[];
data2=load('trainOttawaSAR_y1.mat');
train_y=data2.train_y;

%%多了22行，凑整数行
for i=1:6
   train_x(i,:)=[];
   train_y(i,:)=[];
end

%%  ex1 train a 100 hidden unit RBM and visualize its weights
%设定隐层单元数为100，而可视层单元数为输入向量的个数，由输入数据决定
rand('state',0)
dbn.sizes = [250 200 100];
opts.numepochs =   1; %是计算时根据输出误差返回调整神经元权值和阀值的次数
%训练次数，用同样的样本集，别人训练的时候：1的时候11.41%error，5的时候4.2%error，10的时候2.73%error
opts.batchsize = 100;  %每次挑出一个batchsize的batch来训练，也就是每用batchsize个样本就调整一次权值，而不是把所有样本都输入了，计算所有样本的误差了才调整一次权值
opts.momentum  =   0;%动量
opts.alpha     =   1; %学习率
dbn = dbnsetup(dbn, train_x, opts);  %构建DBN网络，并返回
dbn = dbntrain(dbn, train_x, opts);%给定训练样本，训练网络
%figure; visualize(dbn.rbm{1}.W');   %  Visualize the RBM weights
disp('DBN finished and its parameter is');  
disp(opts);


%%投入BP网络训练，可以运行，但还需稍作调整，并且测试集还未构造出来
%unfold dbn to nn
nn = dbnunfoldtonn(dbn, 2); %1为输出层节点数
nn.activation_function = 'sigm';  %nnsetup底层里本身有激活函数的设定，
                                   %但这里根据具体应用进行了改变

%train nn
opts.numepochs =  1;
opts.batchsize = 100;
%最后fine tuning就再训练一下NN就可以了
nn = nntrain(nn, train_x, train_y, opts);
%用测试样本测试
%待解决：如何用网络nn测试样本，得到一幅二值图片？

data3=load('testYellow_x.mat');
test_x=data3.test_x;
test_x(1,:)=[];
labels=nnpredict(nn, test_x);
%%
counts=0;
for ii=1:size(labels)
    if labels(ii)==1
        counts=counts+1;
    end
end
save('labels1.mat','labels');
%%

%再用预测出的labels重构出一个预测二值图片test_y
%[er, bad] = nntest(nn, test_x, test_y);

%assert(er < 0.10, 'Too big error');
%disp(er);

