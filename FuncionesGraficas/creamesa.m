
function mesa=creamesa(length,width,pos,color,linewidth)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    cin1=Punto([0;0;0]);
    cin2=Despl(0,length,0)*cin1;
    cin3=Despl(width,0,0)*cin1;
    cinta1=crealin(cin1,cin2,color,linewidth);
    cinta2=crealin(cin1,cin3,color,linewidth);
    cinta3=copilin(cinta1,Despl(width,0,0));
    cinta4=copilin(cinta2,Despl(0,length,0));
    PP1 = Punto([0;0;-z]);
    PP2 = Punto([0;0;0]);
    
    pata1=crealin(PP1,PP2,color,linewidth);
    pata2=copilin(pata1,Despl(width,0,0));
    pata3=copilin(pata1,Despl(0,length,0));
    pata4=copilin(pata1,Despl(width,length,0));
    mesa=[cinta1;cinta2;cinta3;cinta4;pata1;pata2;pata3;pata4];
    dibuobj(mesa,Despl(x,y,z));
end
