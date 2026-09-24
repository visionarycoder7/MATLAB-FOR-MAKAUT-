clc; clear all; close all;
R = 10^3;
L = 10^3;
c = 10^(-6);

Ng1 = [1];
Dg1 = [L*c R*c 1];
G1 = tf(Ng1, Dg1);

p = pole(G1)
z = zero(G1)

subplot(2,2,1);
pzmap(G1);

subplot(2,2,2);
impulse(G1);

subplot(2,2,3);
step(G1);

subplot(2,2,4);
t = 0:0.1:10;
r = t;
lsim(G1, r, t);
title('Ramp Response');

