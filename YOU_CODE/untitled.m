clc
clear
close all

np = 1000;

ns = 5;
nv = 3;

nsd = 3;
nvd = 2;



rng(2)

SV = round(rand(ns,nv)*10000)/10000;
SV = SV ./ sum(SV);
NSV = round(SV * np);

% sound
smu = 50*rand(ns,nsd) + 20; % translation
ssig = 5 * rand(ns,nsd); % sigma

% vital signs
vmu = 80*rand(nv,nvd) + 20; % translation
vsig = 8 * rand(nv,nvd); % sigma

ss = [];
vv = [];
SVList = [];

for i = 1: ns
   for j = 1:nv
      gts = gmdistribution(smu(i,:),ssig(i,:));
      gtv = gmdistribution(vmu(j,:),vsig(j,:));
      ss = [ss; random(gts,NSV(i,j))];
      vv = [vv; random(gtv,NSV(i,j))];
      zz = [ones(NSV(i,j),1)*i, ones(NSV(i,j),1)*j];
      SVList = [SVList; zz];
   end
end

figure
subplot(1,2,1)
scatter3(ss(:,1),ss(:,2),ss(:,3),'.')
daspect([1 1 1])
subplot(1,2,2)
scatter(vv(:,1),vv(:,2),'.')
daspect([1 1 1])

%% Spectral Clustering

sigma = 4;
Ds = squareform(pdist(ss));
W = exp(-Ds.*Ds/(2*sigma^2));
D = diag(sum(W,2));
L = D - W;
D = sum(D,2);
D2 = diag(D.^(-0.5));
LN = D2*L*D2;
D = eig(LN);
D = sum(D, 2);
figure
plot(D(1:10))

for i = 1:size(D)
   if D(i) > 0.1
      break;
   end
end
nc = i - 1;

%% GMM
GMModel = fitgmdist(ss,nc);
for i = 1:nc
   gmm = gmdistribution(GMModel.mu(i,:),GMModel.Sigma(:,:,i));
   prodf(:,i) = pdf(gmm,ss);
end
[~,I] = max(prodf,[],2);



%% Spectral Clustering
Dv = squareform(pdist(vv));
W = exp(-Dv.*Dv/(2*sigma^2));
D = diag(sum(W,2));
L = D - W;
D = sum(D,2);
D2 = diag(D.^(-0.5));
LN = D2*L*D2;
D = eig(LN);
D = sum(D, 2);
figure
plot(D(1:10))

for i = 1:size(D)
   if D(i) > 0.1
      break;
   end
end
nc = i - 1;

%% GMM
GMModel = fitgmdist(vv,nc);
for i = 1:nc
   gmm = gmdistribution(GMModel.mu(i,:),GMModel.Sigma(:,:,i));
   prodf(:,i) = pdf(gmm,vv);
end
[~,I] = max(prodf,[],2);

csv = max(SVList); %count to construct SV Table
SVTable = zeros(csv(1), csv(2));

for i = 1:size(SVList, 1)
   SVTable(SVList(i,1),SVList(i,2)) = SVTable(SVList(i,1),SVList(i,2)) + 1;
end

SVTable





