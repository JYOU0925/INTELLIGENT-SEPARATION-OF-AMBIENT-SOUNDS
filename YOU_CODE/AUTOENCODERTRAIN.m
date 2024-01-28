
function [AUTOENCODER,feat] = AUTOENCODERTRAIN(MFCCVector,m,n,k)
   rng('default')
   AUTOENCODER = {};
   FEAT = {};
   feat = MFCCVector;
   count = 0;
   hiddenSize = size(MFCCVector, 1);
   
   %% loop autoencoder
   while 1
      if round(hiddenSize / m) > n
         hiddenSize = round(hiddenSize / m);
         autoenc = trainAutoencoder(feat,hiddenSize, ...
          'MaxEpochs',k, ...
          'L2WeightRegularization',0.004, ...
          'SparsityRegularization',4, ...
          'SparsityProportion',0.15, ...
          'ScaleData', false);
         count = count + 1;
         AUTOENCODER{end+1} = autoenc;
         feat = encode(autoenc,feat);
         FEAT{end+1} = feat;
      end
      break;
   end
   
   %% last autoencoder 
   hiddenSize = n;
   autoenc = trainAutoencoder(feat,hiddenSize, ...
    'MaxEpochs',k, ...
    'L2WeightRegularization',0.002, ...
    'SparsityRegularization',4, ...
    'SparsityProportion',0.1, ...
    'ScaleData', false);
   count = count + 1;
   AUTOENCODER{end+1} = autoenc;
   feat = encode(autoenc,feat);
   FEAT{end+1} = feat;
  
% %    %% softmax
% %    softnet = trainSoftmaxLayer(feat,ClassInfo,'MaxEpochs',k);

% %    %% stack
% %    stackednet = COUNTSTACK(count,AUTOENCODER,softnet);
% %    view(stackednet)
% %    
% % %    %% test data
% % %    y = stackednet(MFCCVector);
% % %    plotconfusion(ClassInfo,y);
% % %    
% % %    % Perform fine tuning
% %     stackednet = train(stackednet,MFCCVector,ClassInfo);
% % %    
% %    y = stackednet(MFCCVector);
% %    plotconfusion(ClassInfo,y);
   end