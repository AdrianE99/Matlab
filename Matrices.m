function [K, M,f1,f2,f3,A]=Matrices( )
clear all
clc;
syms x L Ao E rho 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Funcion de area de la viga')
A=Ao*(1-x/(2*L)); 
pretty (A)
disp(' ')
disp('Funciones trial')
f1=sin((pi*x)/(2*L));
f2=sin((3*pi*x)/(2*L));
f3=sin((5*pi*x)/(2*L));
pretty (f1)
pretty (f2)
pretty (f3)

f=[f1,f2,f3];
for i=1:3
    for j=1:3
        K(i,j)=(int(A*E*diff(f(i),x)*diff(f(j),x),0,L));   
    end
end
for i=1:3
    for j=1:3
        M(i,j)=int(rho*A*f(i)*f(j),0,L);
    end
end
end