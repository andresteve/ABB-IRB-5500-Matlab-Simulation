
%Pasar una matriz de posiciones en el espacio de articulaciones
%
% q = [qeje1 qeje2 qeje3...]
%     [qeje1 qeje2 qeje3...]
%     [qeje1 qeje2 qeje3...]
% Devuelve la trayectorya polinomial en el espacio de articulaciones
% Entre cada posicion y la siguiente.

function [qpos]=gentrayc_polinomial(qtray,tf)
    t=[0.1:0.1:tf];
    a=0;
    b=0;
    c=0;
    d=0;
    qpos = [];
    for k=1:size(qtray,1)-1  %Por cada posicion (en el espacio de articulacion)
        qi = qtray(k,:);
        qf = qtray(k+1,:);
        q_art=[];
        for i=1:size(qtray,2) %Por cada articulacion
            d=qi(i);
            a=-2*(qf(i)-qi(i))/(tf^3);
            b=3*(qf(i)-qi(i))/(tf^2);
            q=[];
            for v=1:size(t,2)
               q(v)= a*(t(v)^3) + b*(t(v)^2) + d;
            end
            q_art=[q_art,q'];
        end
        qpos = [qpos; q_art];
    end
end
