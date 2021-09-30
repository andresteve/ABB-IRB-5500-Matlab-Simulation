% Mueve la pieza sobre la cinta transportadora.
% Step incremento por cada iteracion
% Eje x=1,y=2,z=3;
% Direccion positiva = 1 negativo = 0
function mpieza(obj,step,distance,eje,dir)
    stepx=0;
    stepy=0;
    stepz=0;
    nstep = round(distance / step);
    if( dir == 0)
        step = -step;
    end
    if( eje == 1)
        stepx = step;
    end
    if( eje == 2)
        stepy = step;
    end
    if( eje == 3)
        stepz = step;
    end
    figure(gcf)
    for i=1:nstep
        dibuobj(obj,Despl(stepx,stepy,stepz));
        drawnow
    end
end