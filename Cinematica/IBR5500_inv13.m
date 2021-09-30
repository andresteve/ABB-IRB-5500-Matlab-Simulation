function [qsol1,qsol2,qsol3,qsol4]=IBR5500_inv13(r1,MH)

%Obtencion Parametros

d6 = r1(7,3);
p = [MH(1,4), MH(2,4), MH(3,4)]';
a = [MH(1,3), MH(2,3), MH(3,3)]';
pw = p - d6.*a;


%Definimos variables

l1=r1(2,3);
l2=r1(3,2);
l3=r1(5,3);

px=pw(1);
py=pw(2);
pz=pw(3);

%Tolerancias
tol = 10^(-5);
if(abs(px) < tol)
    px=0;
end
if(abs(py) < tol)
    py=0;
end
if(abs(pz) < tol)
    pz=0;
end

%  Eje 1

if((px^2 + py^2) < 0)
    theta1_1= NaN;
    theta1_2 = NaN;
else
     theta1_1 = atan2(py,px);
    if(theta1_1 > 0)
        theta1_2 = theta1_1 - pi;
    else
        theta1_2 = theta1_1 + pi;
    end    
end

%Eje 3

c3 = ((px^2)+(py^2)+((pz-l1)^2)-(l3^2)-(l2^2)) / (2*l2*l3);
s3 = sqrt(1-(c3^2));
theta3_1 = asin(c3);
theta3_2 = pi-theta3_1;

%Eje 2

alfa = atan( (l3*s3 / (l2+l3*c3)));
r=sqrt((px^2)+(py^2));
beta1 = atan( (pz-l1) / r);
beta2 = atan( (pz-l1) / -r);

theta2_1 = -(beta1 - alfa);
theta2_2 = (beta2 - alfa);
theta2_3 = -pi/2 - ((beta1 - alfa)+pi/2);
theta2_4 = -pi/2 - ((beta2 - alfa)+pi/2);

%Variantes theta2_3

if(abs(theta2_3) > pi)
    theta2_3 = -(pi - (beta1 - alfa));
end
if((abs(beta1)>0.7107) && (abs(beta1)<0.7109))
  theta2_3 = -(theta2_3) ;
end
if(beta1<0)
    theta2_3=pi-theta2_1;
end 
  if (abs(beta1)<abs(alfa))  
      theta2_3=pi-theta2_1;
  end
  
%Solucion A
qsol1 = [theta1_1, theta2_1, theta3_1];
qsol2 = [theta1_1, theta2_2, theta3_2];
qsol3 = [theta1_2, theta2_3, theta3_2];
qsol4 = [theta1_2, theta2_4, theta3_1];

end