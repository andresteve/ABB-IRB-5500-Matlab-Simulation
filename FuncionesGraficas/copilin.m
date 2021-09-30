function  lineamod=copilin(linea,matriz)

 [P1 P2]=extrae(linea);

P3= matriz*P1;
P4= matriz*P2;
col=get(linea,'color');
width = get(linea,'LineWidth');
lineamod= crealin(P3,P4,col,width);
end