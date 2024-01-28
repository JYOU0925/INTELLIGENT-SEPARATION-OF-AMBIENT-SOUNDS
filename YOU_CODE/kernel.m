clc
clear
close all

% creat text data 
Vmu = [80 80 130 20;70 98 128 20;100 87 132 20];
Vsigma = [15 8 10 1];
Vgm = gmdistribution(Vmu,Vsigma);
[X,VcompIdx] = random(Vgm,300);
figure
scatter3(X(:,1),X(:,2),X(:,3))

GMModel = fitgmdist(X,3);
figure
y = [zeros(1000,1);ones(1000,1)];
h = gscatter(X(:,1),X(:,2),X(:,3),y);
hold on
gmPDF = @(x,y) arrayfun(@(x0,y0) pdf(GMModel,[x0 y0]),x,y);
g = gca;
fcontour(gmPDF,[g.XLim g.YLim])
title('{\bf Scatter Plot and Fitted Gaussian Mixture Contours}')
legend(h,'Model 0','Model1')
hold off


Smu = [100 80 130;111 91 144;120 90 140;110 87 132;80 70 120;90 98 128];
Ssigma = [1 1 1];
Sgm = gmdistribution(Smu,Ssigma);
[Y,ScompIdx] = random(Sgm,300);

kernel mapping table
KM = [X,VcompIdx,Y,ScompIdx];

mapping table
M = zeros(3,6);
 for index = 1:300
    count = M(KM(index,4),KM(index,8));
    M(KM(index,4),KM(index,8)) = count + 1;
 end
 
 normalize
for i= 1:3
   for j= 1:6
      M(i,j) = M(1,j) / (M(1,j) + M(2,j) + M(3,j));
   end
end

for i = 1:300
   scatter3(X(i,:));
end

% % % probability random matrix
M1 = [0.1 0.2 0.15 0.25 0.25 0.05;
      0.25 0.3 0.15 0.1 0.15 0.05;
      0.1 0.15 0.15 0.35 0.2 0.05];

% % % probability mapping table
for i= 1:300
      a = round(rand*2 +1);
      b = randsrc(1,1,[1 2 3 4 5 6;(M1(a,:))]);
      ID(i,:) = [a,b];
end

% mapping table
M = zeros(3,6);
 for index = 1:300
    count = M(ID(index,1),ID(index,2));
    M(ID(index,1),ID(index,2)) = count + 1;
 end
 
 normalize
for i= 1:3
   for j= 1:6
      sum = M(i,j) + sum ;
   end
end

for i= 1:3
   for k= 1:6
      M(i,j) = M(i,j) / sum;
   end
end