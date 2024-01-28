
function mms = FASTICA(ms)
%% audioread
n = size(ms, 1);
   yy = [];
   Fs = [];
   for i = 1:n
      [ty,tF] = audioread(ms{i});
      yy = [yy, ty];
      Fs = [Fs, tF];      
   end
   
%% figure
%    figure(1);
%    for i = 1:n
%       subplot(2,2,i);
%       plot(yy(:,1));
%       title(['Signal ' num2str(i)]);
%       hold on;
%    end
%    hold off
 
%% mix sign
   S = yy';
   Sweight = rand(size(S,1));            
   MixedS = Sweight * S;
   MixedS_bak = MixedS;  

%% figure
%    figure(2);
%    for i = 1:n
%       subplot(2,2,i);
%       plot(MixedS(i,:));
%       title(['Signal ' num2str(i)]);
%       hold on;
%    end
%    hold off 
   
%% normallize
MixedS_mean = zeros(4,1);
for i=1:4
    MixedS_mean(i) = mean(MixedS(i,:));
end    

for i = 1:4
   MixedS(i,:)=MixedS(i,:)-MixedS_mean(i);
end

%% 白化

MixedS_cov=cov(MixedS');                    % cov为求协方差的函数
[E,D]=eig(MixedS_cov);                      % 对信号矩阵的协方差函数进行特征值分解
Q=inv(sqrt(D))*(E)';                        % Q为白化矩阵
MixedS_white=Q*MixedS;                      % MixedS_white为白化后的信号矩阵
IsI=cov(MixedS_white');                     % IsI应为单位阵            

%% FASTICA
X=MixedS_white;                            % 以下算法将对X进行操作
[VariableNum,SampleNum]=size(X);
numofIC=VariableNum;                       % 在此应用中，独立元个数等于变量个数
B=zeros(numofIC,VariableNum);              % 初始化列向量w的寄存矩阵,B=[b1  b2  ...   bd]
for r=1:numofIC
    i=1;maxIterationsNum=100;               % 设置最大迭代次数（即对于每个独立分量而言迭代均不超过此次数）
    IterationsNum = 0;
    b=rand(numofIC,1)-.5;                  % 随机设置b初值
    b=b/norm(b);                           % 对b标准化 norm(b):向量元素平方和开根号,,相当于单位化向量b
    while i<=maxIterationsNum+1
        if i == maxIterationsNum           % 循环结束处理
            fprintf('\n第%d分量在%d次迭代内并不收敛。', r,maxIterationsNum);
            break;
        end
        bOld=b;                          
        a2=1;
        u=1;
        t=X'*b;
        g=t.*exp(-a2*t.^2/2);%相当于g=y.e(-y2/2)
        dg=(1-a2*t.^2).*exp(-a2*t.^2/2);%对g的求导
        b=((1-u)*t'*g*b+u*X*g)/SampleNum-mean(dg)*b;%对应公式3-11
                                           % 核心公式，参见理论部分公式2.52
        b=b-B*B'*b;                        % 对b正交化
        b=b/norm(b); 
        if abs(abs(b'*bOld)-1)<1e-9        % 如果收敛，则
             B(:,r)=b;                     % 保存所得向量b
             break;
         end
        i=i+1;        
    end
%    B(:,r)=b;                                % 保存所得向量b
end

%% ICA计算的数据复原
ICAedS = B'*Q*MixedS_bak;                     % 计算ICA后的矩阵
   mms = [];
   for i = 1:n
      fn = ['MIXxx_' num2str(i) '.wav'];
      audiowrite(fn, rescale(ICAedS(i,:), -1, 1), Fs(i));
      mms = [mms; fn];
   end
   mms = cellstr(mms);

%% figure
%    figure(3);
%    for i = 1:n
%       subplot(2,2,i);
%       plot(ICAedS(i,:));
%       title(['Signal ' num2str(i)]);
%       hold on;
%    end
%    hold off  
end