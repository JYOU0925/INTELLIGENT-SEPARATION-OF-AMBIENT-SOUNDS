
function [I,prodf] = GMM(data,cluster)
   GMModel = fitgmdist(data,cluster);
   for i = 1:cluster
      gmm = gmdistribution(GMModel.mu(i,:),GMModel.Sigma(:,:,i));
      prodf(:,i) = pdf(gmm,data);
   end
   [~,I] = max(prodf,[],2);
end