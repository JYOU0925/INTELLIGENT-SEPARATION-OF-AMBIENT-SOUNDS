clc
clear
close all

% file = dir('/Users/apple/Documents/COMP4100/data/');
% data=[];
% for i= 1:(length(file)-3)
% 
%     [data,fs] = audioread('/Users/apple/Documents/COMP4100/data/1.wav');
% 
%     name = '1.wav';
% 
%     name = name(1:end-4);
% 
%     name = strcat(name,'.wav');
% 
%     audiowrite(name,data,fs);
% end

[x,fs] = audioread('/Users/apple/Documents/COMP4100/code/MIX_1.wav');

start_time = 5;

end_time = 25;

Y_new=x((fs*start_time+1):fs*end_time,1);

audiowrite('5.wav',Y_new,fs);
