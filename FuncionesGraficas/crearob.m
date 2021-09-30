% Crea el robot dado en la configuración dada.

function elem=crearob(robot,q)
linewidth = 3;
elem=[];
matriz=dh(robot,0,0);
if (size(q,1)==1)
    q=q';
end
	Pi=matriz*Punto(robot(1,6:8)');
	Pf=matriz*Punto(robot(1,9:11)');
	color=robot(1,12:14);
	elem(1)=crealin(Pi,Pf,color,linewidth);
line = 2;
for i=1:size(robot,1)-1
	matriz=matriz*dh(robot,i,q(i));
	Pi=matriz*Punto(robot(i+1,6:8)');
	Pf=matriz*Punto(robot(i+1,9:11)');
	color=robot(i+1,12:14);
    % Modifica por la linea anadida en el medio
    if(i >= 4)
        linewidth = 2;
    end
	if i == 2
        Pxi = Pi;
        col = color;
    end
    if i == 3
        Pxf = Pi;
        elem(line)=crealin(Pxi,Pxf,col,linewidth);
        line = line+1;
        elem(line) = crealin(Pi,Pf,color,linewidth); 
    else
        elem(line)=crealin(Pi,Pf,color,linewidth);
    end
    line = line+1;
    
end
elem=elem';
