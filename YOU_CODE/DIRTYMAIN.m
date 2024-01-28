clc
clear
close all

%% sound
DataPath = '/Users/apple/Documents/COMP4100/code/DATA/';

%% load audio data && cut data
[MFCCVector, ClassInfo] = LoadAudioData(DataPath);

%%

%% vital sign
Vmu = ;
Vsigma = ;
VITALM = GMVITAL(Vmu,Vsigma,P);


