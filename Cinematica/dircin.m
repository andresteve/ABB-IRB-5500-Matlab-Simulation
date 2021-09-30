
function [matriz2]=dircin(r1,q2)
if (size(q2,1)==1)
    q2=q2';
end
 matriz2=dh(r1,1,q2(1));
 
for i=2:size(q2,1)
    
   matriz2=matriz2*dh(r1,i,q2(i));
   
end
