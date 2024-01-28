
function VITALM = GMVITAL(Vmu,Vsigma,P)
   Vgm = gmdistribution(Vmu,Vsigma,P);
   [X,VcompIdx] = random(Vgm,300);
   figure
   scatter3(X(:,1),X(:,2),X(:,3));
   kernel mapping table
   VITALM = [X,VcompIdx];
end