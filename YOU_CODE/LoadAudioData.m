
function [MFCCVector, ClassInfo] = LoadAudioData(DataPath)
   %% read foldername
   foldername = dir(DataPath);
   
   %% remove . and ..
   foldername(1) = [];
   foldername(1) = [];
   foldername(1) = [];
   n = length(foldername);
   
   %% read audio 
   MFCCVector = [];
   ClassInfo = [];
   for i = 1:n
      filename = dir([foldername(i).folder '/' foldername(i).name '/*.wav']);
      m = length(filename);
      c = zeros(n, 1);
      c(i) = 1;
      for j = 1:m
         stime = 20;
         etime = 30;
         for k = 1:2
            [x, fs] = audioread([filename(j).folder '/' filename(j).name]);
            y = x((fs*stime+1):fs*etime, 1);
            stime = stime + 10;
            etime = etime + 10;

            %% extract features from MFCC
            MFCCVector = [MFCCVector, reshape(mfcc(y, fs), [], 1)];
            ClassInfo = [ClassInfo, c];

            %% save segment to a wave file
            NewName = ['./database/' foldername(i).name '_' num2str(j) '_' num2str(k) '.wav'];
            audiowrite(NewName, y, fs);
         end
      end
   end
   
end

