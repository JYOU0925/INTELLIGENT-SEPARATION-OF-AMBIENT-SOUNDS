
function [MTABLE, P] = RANDMAPPING(CSOUND,CVITAL)
   MTABLE = rand(CSOUND,CVITAL);
   P = zeros(1,CVITAL);
   for i = 1:CVITAL
      for j = 1:CSOUND
         P(i) = P(i) + MTABLE(j,i);
      end
   end
   count = 0;
   for i = 1:CVITAL
      count = P(i) + count;
   end
   for i = 1:CVITAL
      P(i) = P(i) / count;
   end
end