clc
clear
close all

%% sound
[MFCCVector, ClassInfo] = LoadAudioData('/Users/apple/Documents/COMP4100/code/DATA/');
[AUTOENCODER,feat] = AUTOENCODERTRAIN(MFCCVector,5,50,100);
ssigma = 0.001;
cluster = SPECTRALCLUSTERING(ssigma,feat);
[VI,Vprodf] = GMM(feat,cluster);

% % vital
% vital = cell2mat(struct2cell(load('vital')));
% vsigma =2.5;
% cluster = SPECTRALCLUSTERING(vsigma,vital);
% [SI,Sprodf] = GMM(vital,cluster);

%% mapping
