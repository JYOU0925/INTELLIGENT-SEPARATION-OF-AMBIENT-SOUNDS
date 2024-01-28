clc
clear
close all

% file = dir('/Users/apple/Documents/COMP4100/code/data/*.wav');
file = dir('/Users/apple/Documents/COMP4100/code/data/');
n = size(file,1);
for i = i:n
%    if isfolder(file(i+3).name)
   if isfolder('/')
      a = 3
   end
end
% coeffs = cut(file);
% 
% function output = Cut(file)
%    yy = [];
%    Fs = [];
%    name = file.name;
%    for i= 1:length(file)
%       [ty,tF] = audioread(file.name);
%       ty = rescale(ty, -1, 1);
%       yy = [yy, ty];
%       Fs = [Fs, tF];      
%    end
%       
%     output = 1;  
%
%    end
% end