function [ check] = choose_Sample(changed_map)
%%输入为change_map图像
%%输出与change_map大小相同的check矩阵，如果当前check值为255，则为可用点，如果为0，则为不可用点。如果为125，则为备选点（可能为边界点）。  

%test
n=3;%邻域大小
alph=0.5;

[rows cols]=size(changed_map);
check=zeros(rows,cols);
check=changed_map;

for i=3:rows-2
    for j=3:cols-2
        count=0;
        for ii=-(n-1)/2:(n-1)/2
            for jj=-(n-1)/2:(n-1)/2
                if(changed_map(i+ii,j+jj)==changed_map(i,j))
                    count=count+1;
                end
            end
        end
        if(count/(n*n)>(alph*1.5))
            check(i,j)=255;
        
        else if(count/(n*n)>alph)
            check(i,j)=125;
            else
            check(i,j)=0;
        end
    end
end




end

