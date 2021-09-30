clear
addpath('Cinematica')  
addpath('FuncionesGraficas')  
addpath('FuncionesUtiles')  
run('IRB5500.m')
run('inigraf.m')
run('creascena.m');

%Calculo la matriz homogenea a partir de donde se encuentra el robot
q=[0,-pi/2,0,0,-pi/2,0];
robot=crearob(r1,q');
MH=dircin(r1,q');
Mtray=MH;
tf = 1;

%Espero que  la pieza llege al sensor 2
mpieza(pieza,10,2000,2,1);

%Muevo el robot para coger la pieza
p1 = MH(1:3,4);
p2=[-2000;1000;900]; %centro de la pieza
%El ultimo parametro de gentrayc_cnf es la configuracion del robot
%(codo-arriba,etc...)
qtrayectoria=gentrayc_recta(p1,p2,tf,Mtray,r1,8,[0,0,0]);
dibrob(robot,r1,qtrayectoria);

%Muevo el robot y la pieza sobre la otra cinta con un movimiento circular
% Antes salgo da la envolvente de la pared subiendo recto en Z
p1 = p2;
p2 =[p1(1);p1(2);p1(3)+200]; 
qtrayectoria = gentrayc_recta(p1,p2,tf,Mtray,r1,8,[0,0,0]);
movercubo(robot,r1,qtrayectoria,pieza);
% Me muevo con la pieza sobre la otra cinta fuera la envolvente de la pared
p1 = p2;
p2=[2000;1000;900+200]; 
qtrayectoria = gentrayc_circular(p1,p2,tf,Mtray,r1,8,[0,0,0],1);
movercubo(robot,r1,qtrayectoria,pieza);
%Bajo en Z sobre la cinta
p1 = p2;
p2=[2000;1000;900]; 
qtrayectoria = gentrayc_recta(p1,p2,tf,Mtray,r1,8,[0,0,0]);
movercubo(robot,r1,qtrayectoria,pieza);

%Vuelvo a la posicion HOME
% Es necesario hacer un cambio de configuracion
p1 = p2;
p2 = [1331;0;1738];
qtrayectoria = gentrayc_recta(p1,p2,tf,Mtray,r1,3,[0,0,0]);
dibrob(robot,r1,qtrayectoria);

%Espero que llege la pieza al otro sensor
mpieza(pieza,10,2000,2,0);

%Muevo el robot a recoger la pieza sobre la cinta 2
p1 = p2;
p2=[2000;-1000;900]; %centro de la pieza
%El ultimo parametro de gentrayc_cnf es la configuracion del robot
%(codo-arriba,etc...)
qtrayectoria=gentrayc_recta(p1,p2,tf,Mtray,r1,3,[0,0,0]);
dibrob(robot,r1,qtrayectoria);


%Muevo el robot y la pieza sobre el armario
% Antes salgo da la envolvente de la pared subiendo recto en Z
p1 = p2;
p2 =[p1(1);p1(2);p1(3)+500]; 
qtrayectoria = gentrayc_recta(p1,p2,tf,Mtray,r1,3,[0,0,0]);
movercubo(robot,r1,qtrayectoria,pieza);
p1 = p2;
p2=[0;-2400;1200]; 
qtrayectoria = gentrayc_recta(p1,p2,tf,Mtray,r1,3,[0,0,-pi/2]);
movercubo(robot,r1,qtrayectoria,pieza);

%Vuelvo a la posicion HOME
p1 = p2;
p2 = [-1331;0;1738];
qtrayectoria=gentrayc_recta(p1,p2,tf,Mtray,r1,8,[0,0,0]);
dibrob(robot,r1,qtrayectoria);
