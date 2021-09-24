clear all
clc

num=[2.5];
den=[0.25 1];
num1=[700/25];
den2=[10 1];
num3=[10/700];
den3=[0.05 1];
[numg,deng]=series(num,den,num1,den2);
[numK,denK]=series(numg,deng,num3,den3);
FTLA=tf(numK,denK)
zpk (FTLA)

num=[2.5];
den=[0.25 1];
num1=[900/25];
den2=[10 1];
num3=[10/700];
den3=[0.05 1];
[numg,deng]=series(num,den,num1,den2);
[numK,denK]=feedback(numg,deng,num3,den3);
printsys(numK, denK);
FTLC=tf(numK,denK)
polos=pole(FTLC)
rlocus(FTLC)
zpk (FTLC)