% Inversa_DEMO
clear
addpath('Cinematica')  
addpath('FuncionesGraficas')  
addpath('FuncionesUtiles')  
run('IRB5500.m');
run('inigraf.m');

%Configuración Inicial
q = [pi/4,(-pi/2-pi/6),(pi/6),pi/4,-pi/3,0];
MH = dircin(r1,q');
robot = crearob(r1,q');

%Resolucion de la Inversa
[qf1,qf2,qf3,qf4,qf5,qf6,qf7,qf8]=invIBR5500(r1,MH);

%Crea un recta donde el punto final sea la posición sobre la que se va a
%realizar la demo
pfinal=[MH(1,4);MH(2,4);MH(3,4)];
pinicial=[MH(1,4);MH(2,4);abs(MH(3,4))-abs(MH(3,4))];
punta=crealin([eye(3) pinicial;0 0 0 1], [eye(3) pfinal ;0 0 0 1],[1 0 0],4);
%POS 1
qi=[0,0,0,0,0,0];
qf=qf1;
qtray = [qi;qf];
tf= 10;
pl=gentrayc_polinomial(qtray,tf);
dibrob(robot,r1,pl);

pause(2)

%POS 2
qi=qf1;
qf=qf2;
qtray = [qi;qf];
tf= 10;
pl=gentrayc_polinomial(qtray,tf);
dibrob(robot,r1,pl);

pause(2)

%POS 3
qi=qf2;
qf=qf3;
qtray = [qi;qf];
tf= 10;
pl=gentrayc_polinomial(qtray,tf);
dibrob(robot,r1,pl);

pause(2)

%POS 4
qi=qf3;
qf=qf4;
qtray = [qi;qf];
tf= 10;
pl=gentrayc_polinomial(qtray,tf);
dibrob(robot,r1,pl);

pause(2)

%POS 5
qi=qf4;
qf=qf5;
qtray = [qi;qf];
tf= 10;
pl=gentrayc_polinomial(qtray,tf);
dibrob(robot,r1,pl);

pause(2)

%POS 6
qi=qf5;
qf=qf6;
qtray = [qi;qf];
tf= 10;
pl=gentrayc_polinomial(qtray,tf);
dibrob(robot,r1,pl);

pause(2)

%POS 7
qi=qf6;
qf=qf7;
qtray = [qi;qf];
tf= 10;
pl=gentrayc_polinomial(qtray,tf);
dibrob(robot,r1,pl);

pause(2)

%POS 8
qi=qf7;
qf=qf8;
qtray = [qi;qf];
tf= 10;
pl=gentrayc_polinomial(qtray,tf);
dibrob(robot,r1,pl);

