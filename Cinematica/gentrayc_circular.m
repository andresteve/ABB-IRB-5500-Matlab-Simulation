function [qtray] = gentrayc_circular(p1,p2,tf,MH,r1,cnf,orient,dir)
    pix = p1(1);
    piy = p1(2);
    piz = p1(3);
    pfx = p2(1);
    pfy = p2(2);
    pfz = p2(3);
    r = sqrt( (pix^2+piy^2+pfx^2+pfy^2) / 2);
    angPi = atan2(piy,pix);
    angPf = atan2(pfy,pfx);
    if (dir == 0)
        arco = pi-(angPi-angPf);
    else
        arco = angPi-angPf;
    end
    nstep = 20;
    angStep = arco/nstep;
    zstep = (piz - pfz)/nstep;
    puntos=[p1];
    for i=1:nstep-1
        a = angPi-angStep*i;
        px = r*cos(a);
        py = r*sin(a);
        pz= piz-zstep*i;
        p = [px;py;pz];
        puntos = [puntos, p];
    end
    puntos = [puntos, p2];
    
    %Cinematica inversa por cada punto
    qtray_inv=[];
    N = size(puntos,2);
    for i=1:N
        p=puntos(:,i);
        alfa = orient(1)*i/N;
        beta = orient(2)*i/N;
        gamma = orient(3)*i/N;
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
    qtray_inv = [qtray_inv; qsel];
    end
    qtray=gentrayc_polinomial(qtray_inv,tf);
end