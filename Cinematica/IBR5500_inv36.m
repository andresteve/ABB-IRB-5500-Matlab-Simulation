function [qf1,qf2]=IBR5500_inv36(r1,MH,qsol)

q13=qsol;

A03=dh(r1,1,q13(1))*dh(r1,2,q13(2))*dh(r1,3,q13(3));

R03=rotacion(A03);

% Se obtiene la matriz de rotacion R36 
R36=inv(R03)*rotacion(MH);
r23=real(R36(2,3));
r13=real(R36(1,3));
r33=real(R36(3,3));
r32=real(R36(3,2));
r31=real(R36(3,1));
%Tolerancias
tol = 10^(-5);
if(abs(r23) < tol)
    r23=0;
end
if(abs(r13) < tol)
    r13=0;
end
if(abs(r33) < tol)
    r33=0;
end
if(abs(r32) < tol)
    r32=0;
end
if(abs(r31) < tol)
    r31=0;
end
% Se extraen los datos de las tres últimas coordenadas generalizadas para los dos casos.

%Configuracion A
q36a(1)=atan2(r23,r13);
q36a(2)=acos(r33);
q36a(3)=atan2(r32,-r31);

%Configuracion B
%EJE 4

if (q36a(1)>0)   
 q36b(1)=q36a(1)- pi;
 else
 q36b(1)=q36a(1)+ pi;
end

%EJE5

q36b(2)=-q36a(2);

%EJE 6 
if (q36a(3)>0)   
 q36b(3)=q36a(3)- pi;
 else
 q36b(3)=q36a(3)+ pi;
end

qf1=[q13,q36a];
qf2=[q13,q36b];
end