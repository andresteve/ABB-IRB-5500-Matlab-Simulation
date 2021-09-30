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
q = [0,0,0,orient];
MH = dircin(r1,q');
robot = crearob(r1,q');

%Elegimos la configuracion de las 8 posibles (default:8)
conf=8;

%Definimos los puntos y el tiempo
opts.Interpreter = 'tex';     
y=inputdlg({'Px [-1500,1500]:','Py [-1500,1500]:','Pz [-1500,1500] :'},'Punto Inicial: ',[1 50; 1 50; 1 50],{'-1000','-500','800'},opts);
Pxi= str2num(y{1});
Pyi= str2num(y{2});
Pzi= str2num(y{3});

opts.Interpreter = 'tex';     
y=inputdlg({'Px[-1500,1500]:','Py[-1500,1500]:','Pz[-1500,1500]:'},'Punto Final: ',[1 50; 1 50; 1 50],{'-1000','-1000','1800'},opts);
Pxf= str2num(y{1});
Pyf= str2num(y{2});
Pzf= str2num(y{3});
p1=[Pxi;Pyi;Pzi];
p2=[Pxf;Pyf;Pzf];

tf=1;
Mtray=MH;


%Creo la trayectoria y dibujo la trayectoria que debe seguir el robot
qpath=gentrayc_recta(p1,p2,tf,Mtray,r1,conf,orient);
path=crealin([eye(3) p1;0 0 0 1], [eye(3) p2 ;0 0 0 1],[0.1 0.1 1],1);

for i=1:size(qpath,1)
    pos=qpath(i,:);
    modrob(r1,pos',robot);
    pause(tf/size(qpath,1));
end