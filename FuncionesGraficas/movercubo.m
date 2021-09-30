function movercubo(robot,r1,trayectoria,objecto)
figure(gcf)
for i=1:size(trayectoria,1)-1
    %Calculo la cinematica directa para saber la posicion de la herramienta
    %en cada istante de la trayectoria
    MH = dircin(r1,trayectoria(i,:)');
    MH2 = dircin(r1,trayectoria(i+1,:)');
    MHO = MH2*inv(MH);
    dibuobj(objecto,MHO);
	modrob(r1,trayectoria(i,:)',robot)
    drawnow
end
end