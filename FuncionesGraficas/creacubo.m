% Crea el cubo de basura
function cubo = creacubo (dimension,pos,color,linewidth)
    x = pos(1);
    y = pos(2);
    z = pos(3);
    Cubo1=Punto([0,0,0]');
    Cubo2=Despl(dimension,0,0)*Cubo1;
    ariscub1= crealin(Cubo1,Cubo2,color,linewidth);
    ariscub2=copilin(ariscub1,Despl(0,dimension,0));
    ariscub3=copilin(ariscub1,rotaz(pi/2));
    ariscub4=copilin(ariscub3,Despl(dimension,0,0));
    carcub1=[ariscub1;ariscub2;ariscub3;ariscub4];
    carcub2=copiobj(carcub1,Despl(0,0,dimension));

    Cubo3=Despl(0,0,dimension)*Cubo1;
    ariscub5=crealin(Cubo1,Cubo3,color,linewidth);
    ariscub6=copilin(ariscub5,Despl(dimension,0,0));
    ariscub7=copilin(ariscub6,Despl(0,dimension,0));
    ariscub8=copilin(ariscub7,Despl(-dimension,0,0));

    cubo=[carcub1;carcub2;ariscub5;ariscub6;ariscub7;ariscub8];
    dibuobj(cubo,Despl(x,y,z));
end

