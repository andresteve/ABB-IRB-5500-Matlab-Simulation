%Posiciones casuales para demonstrar como la pieza se mueva y rueda con 
%la herramienta del robot

clear
addpath('Cinematica')  
addpath('FuncionesGraficas')  
addpath('FuncionesUtiles')  
run('inigraf.m');
run('IRB5500.m');
%Introduccion Objetos
pos= [1100,-300,2156];
pieza = creapoligono(600,400,500,pos,[1,0,0],2);

qi = [0,0,0,0,0,0];
robot=crearob(r1,qi');
MH = dircin(r1,qi);

pause(2)
qf = [pi/4,-pi/2,0,0,0,3/2*pi];
qtray = gentrayc_polinomial([qi;qf],10);
movercubo(robot,r1,qtray,pieza);

pause(2)
qi=qf;
qf = [-pi/3,-pi/2,pi/3,0,-pi/2,-pi/6];
qtray = gentrayc_polinomial([qi;qf],10);
movercubo(robot,r1,qtray,pieza);

pause(2)
qi=qf;
qf = [-pi/3,0,pi/2,0,-pi/2,-pi/2];
qtray = gentrayc_polinomial([qi;qf],10);
movercubo(robot,r1,qtray,pieza);
