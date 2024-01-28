clc
clear
close all

Vmu = [85 80 125; %喜
       92 95 136; %怒
       80 85 130; %悲
       87 75 133];%惧
   
Vsigma = [4 3 5;
          6 6 7;
          3 4 5;
          5 3 4];

       y = [];
p = [160,140,120,80];
for i = 1:4       
   Vgm = gmdistribution(Vmu(i,:),Vsigma(i,:));
   [X,VcompIdx] = random(Vgm,p(:,i)); 
   y = [y;X];
end

figure
scatter3(y(:,1),y(:,2),y(:,3))