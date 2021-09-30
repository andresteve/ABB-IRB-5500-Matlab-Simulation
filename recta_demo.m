%Ejecuta el programa de una recta
clear
addpath('Cinematica')  
addpath('FuncionesGraficas')  
addpath('FuncionesUtiles')  
run('IRB5500.m');
run('inigraf.m');

%Definimos la orientacion y creamos el robot
alfa=0;
beta=0;
gamma=0;
orient=[alfa,beta,gamma];

q = [pi/4,-pi/2,0,orient];
MH = dircin(r1,q');
robot = crearob(r1,q');

%Definimos los puntos y el tiempo
p1=[-1000;-500;800];
p2=[-1000;-1000;1800];
tf=1;
Mtray=MH;

%Elegimos la configuracion de las 8 posibles
conf=8;


%Creo la trayectoria y dibujo la trayectoria que debe seguir el robot
qpath=gentrayc_recta(p1,p2,tf,Mtray,r1,conf,orient);
path=crealin([eye(3) p1;0 0 0 1], [eye(3) p2 ;0 0 0 1],[0.1 0.1 1],1);

for i=1:size(qpath,1)
    pos=qpath(i,:);
    modrob(r1,pos',robot);
    pause(tf/size(qpath,1));
end
