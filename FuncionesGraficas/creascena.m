run('inigraf.m');
run('IRB5500.m');

%Configuracion
linewidth = 1.5;
verde = [0 1 0];
azul = [0 0 1];
negro = [0 0 0];
marron = [0.4 0 0];
red = [1 0 0];

%3.2 Modelo del entorno de trabajo
cinta = creamesa(4000,1000,[-2500,-2000,500],verde,linewidth);
cinta2 = creamesa(4000,1000,[1500,-2000,500],verde,linewidth);
pared1 = creamesa(4000,100,[-2500,-2000,600],negro,linewidth);
pared11 = creamesa(4000,100,[-1500,-2000,600],negro,linewidth);
pared2 = creamesa(4000,100,[1500,-2000,600],negro,linewidth);
pared21 = creamesa(4000,100,[2500,-2000,600],negro,linewidth);
a1 = creamesa(-500,2000,[-1000,-2200,800],marron,linewidth);
a2 = creamesa(-500,2000,[-1000,-2200,1600],marron,linewidth);
a3 = creamesa(-500,2000,[-1000,-2200,2400],marron,linewidth);
sensor1 = creacubo(100,[-2500,-1050,600],red,linewidth);
sensor11 = creacubo(100,[-2500,950,600],red,linewidth);
sensor2 = creacubo(100,[2500,-1050,600],red,linewidth);
sensor22 = creacubo(100,[2500,1000,600],red,linewidth);

%Introduccion Objetos
pieza = creapoligono(600,300,400,[-2100,-1300,500],azul,linewidth);
