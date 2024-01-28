
function cluster = SPECTRALCLUSTERING(sigma,FEAT)
   SquarV = squareform(pdist(FEAT));
   W = exp(-SquarV.*SquarV/(2*sigma^2));
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
   cluster = i - 1;
end