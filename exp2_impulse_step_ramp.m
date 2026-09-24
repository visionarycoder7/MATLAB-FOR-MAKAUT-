clc; clear all; close all;

Ng1 = [1];
Dg1 = [1 10];
G1 = tf(Ng1, Dg1);

Ng2 = [1];
Dg2 = [1 1];
G2 = tf(Ng2, Dg2);

Ng3 = [1 0 1];
Dg3 = [1 4 4];
G3 = tf(Ng3, Dg3);

Ng4 = [1 1];
Dg4 = [1 6];
G4 = tf(Ng4, Dg4);

Nh1 = [1 1];
Dh1 = [1 2];
H1 = tf(Nh1, Dh1);

H2 = 2; 
H3 = 1;

Sys1 = H2 / G4;
Sys2 = series(G3, G4);
Sys3 = feedback(Sys2, H1, -1);
Sys4 = series(G2, Sys3);
Sys5 = feedback(Sys4, Sys1, +1);
Sys6 = series(Sys5, G1);
Sys = feedback(Sys6, H3, -1);

p = pole(Sys)
z = zero(Sys)

subplot(2,2,1);
pzmap(Sys);

subplot(2,2,2);
impulse(Sys); grid on;

subplot(2,2,3);
step(Sys); grid on;

t = 0:0.1:10;
r = t;

subplot(2,2,4);
lsim(Sys, r, t);
title('Ramp response');

