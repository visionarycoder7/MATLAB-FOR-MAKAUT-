clc;close all;clear all;
Ng1=[2];
Dg1=[1 3];
G1=tf(Ng1,Dg1);

Ng2=[1];
Dg2=[1 2 5];
G2=tf(Ng2,Dg2);

Nh=[5];
Dh=[1 4];
H=tf(Nh,Dh);
G3=series(G1,G2);
sys=feedback(G3,H,-1)
p=pole(sys)
z=zero(sys)
subplot(2,2,1);
pzmap(sys);
subplot(2,2,2);
step(sys);
grid on;
subplot(2,2,3);
impulse(sys);
grid on;
t=0:0.1:10;
u=t
subplot(2,2,4);
lsim(sys,u,t);
grid on;
title('Ramp response');


CODE 1