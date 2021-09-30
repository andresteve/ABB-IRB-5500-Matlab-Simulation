% Crea el robot dado en la configuración dada.

function modrob(robot,q,lineas)
matriz=eye(4);
line = 2;
if (size(q,1)==1)
    q=q';
end
for i=1:size(robot,1)-1
   matriz=matriz*dh(robot,i,q(i));
   Pi=matriz*Punto(robot(i+1,6:8)');
   Pf=matriz*Punto(robot(i+1,9:11)');
   modlin(lineas(line),Pi,Pf);
   if i == 2
        Pxi = Pi;
   end
   if i == 3
        Pxf = Pi;
        modlin(lineas(line),Pxi,Pxf);
        line = line+1;
        modlin(lineas(line),Pi,Pf);
   end  
   line=line+1; 
end


