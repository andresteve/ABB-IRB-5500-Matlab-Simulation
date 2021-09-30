function poli = creapoligono(length,width,hight,pos,color,linewidth)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    p1=Punto([0;0;0]);
    p2=Despl(0,length,0)*p1;
    p3=Despl(width,0,0)*p1;
    r1=crealin(p1,p2,color,linewidth);
    r2=crealin(p1,p3,color,linewidth);
    r3=copilin(r1,Despl(width,0,0));
    r4=copilin(r2,Despl(0,length,0));
    base = [r1;r2;r3;r4];
    base2 = copiobj(base,Despl(0,0,hight));
    PP1 = Punto([0;0;hight]);
    PP2 = Punto([0;0;0]);
    s1=crealin(PP1,PP2,color,linewidth);
    s2=copilin(s1,Despl(width,0,0));
    s3=copilin(s1,Despl(0,length,0));
    s4=copilin(s1,Despl(width,length,0));
    poli = [base;base2;s1;s2;s3;s4];
    dibuobj(poli,Despl(x,y,z));
end