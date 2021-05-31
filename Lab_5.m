% DFT
clc;
close all;
clear all;
warning('off','all');

% input sequences
xn = input('Enter Smaple Sequence: ');
N = input('Value of N: ');

% finding DFT
[Xk, absX, angleX] = DFT(xn, N);
k = 0:N-1;
n = 0:length(xn)-1;

% plotting
figure(5)
subplot(5,1,1);
stem(n, xn);
xlabel('Sample');
ylabel('Amp');
title('x(n)');
grid on;

subplot(5,1,2);
stem(Xk);
xlabel('Sample');
ylabel('X[K]');
title('DFT of x(n): X(K)');
grid on;

subplot(5,1,3);
stem(k, absX);
xlabel('k');
ylabel('|Xk|');
title('Magnitude Plot: X(K)');
grid on;

subplot(5,1,4);
stem(k, angleX);
xlabel('k');
ylabel('Angle(Xk)');
title('Phase Plot X(K)');
grid on;
