function  dibulin(linea,matriz)
    [P1, P2]=extrae(linea);
    P3= matriz*P1;
    P4= matriz*P2;
    modlin(linea,P3,P4);
end