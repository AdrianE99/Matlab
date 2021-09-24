clear all
clc
syms x L Ao E rho 

%Deterinamos las Matrices K y M
[K, M,f1,f2,f3,A]=Matrices( );
disp(' ')

disp(' "Frecuencias y modos de vibrar Metodo de Ritz"')

disp(' ')

%Matriz K
disp('Matriz K')
pretty (K)
%Matriz M
disp(' ')
disp('Matriz M')
pretty(M)

k=double(K*(L/(Ao*E)));
m=double((M*(1/(rho*Ao*L))));

%Los autovalores y autovectores
[P,D]=eig(k,m);

%Las frecuencias naturales de vibrar

disp(' ')
disp('Frecuencias naturales de vibrar')
fprintf('w1 = %2.4f',sqrt(D(1,1)));
fprintf ('(E/rhoL^2)^1/2\n');
fprintf('w2 = %2.4f',sqrt(D(2,2)));
fprintf ('(E/rhoL^2)^1/2\n');
fprintf('w3 = %2.4f',sqrt(D(3,3)));
fprintf ('(E/rhoL^2)^1/2\n');


%La deformacion del sistema. Sea la longitud de la viga L=100
Xx=sum(P(:,1)*f1);
Xx1=sum(P(:,2)*f2);
Xx2=sum(P(:,3)*f3);

hold on
grid on
figure(1)
Xx=subs(Xx,L,100);
r1=ezplot(Xx,[0 100]);
set(r1, 'Color', 'm');
Xx1=subs(Xx1,L,100);
r1=ezplot(Xx1,[0 100]);
set(r1, 'Color', 'b');
Xx2=subs(Xx2,L,100);
r2=ezplot(Xx2,[0 100]);
set(r2, 'Color', 'r');
title([sprintf('Vibracion axial de la viga empotrada libre')])
legend ('Modo 1','Modo 2','Modo 3');
ylabel ('U(x)','FontName','Arial','FontSize', 14');
