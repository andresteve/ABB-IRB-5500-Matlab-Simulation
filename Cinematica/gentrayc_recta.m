%Igual a la funcion gentrayc pero con la posibilidad de elegir la 
%configuracion, es decir cual solucion de la cinematica inversa
%el parametro es un int (solo son validos los valores 1,2,3,4,5,6,7,8)
%el parametro orient es la orientacion (alfa,beta,gamma) de la herramienta
%respecto a la matriz inicial MH
function [qtray]=gentrayc_recta(pi,pf,tf,MH,r1,cnf,orient)
    qtray =[];
    qsel = [];
    for t=0:0.1:tf
        p=t*pf+(1-t)*pi;     
        alfa = orient(1)*t/tf;
        beta = orient(2)*t/tf;
        gamma = orient(3)*t/tf;
        MH2=rotax(alfa)*rotay(beta)*rotaz(gamma)*MH;
        R = rotacion(MH2);
        A=[R,p; [0, 0, 0, 1]];
        [qf1,qf2,qf3,qf4,qf5,qf6,qf7,qf8]=invIBR5500(r1,A);
        switch cnf
            case 1
                qsel = qf1;
            case 2
                qsel = qf2;
            case 3
                qsel = qf3;
            case 4
                qsel = qf4;
            case 5
                qsel = qf5;
            case 6
                qsel = qf6;
            case 7
                qsel = qf7;
            case 8
                qsel = qf8;
        end
    qtray = [qtray; qsel];
    end
    qtray = gentrayc_polinomial(qtray,tf);
end 