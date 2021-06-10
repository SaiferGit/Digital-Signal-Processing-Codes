% DFT
clc;
close all;
clear all;
warning('off','all');

% input sequences
xn = [1 1 1 0]; %input('Enter Smaple Sequence: ');
N = 8 % input('Value of N: ');

% finding DFT
[Xk, absX, angleX] = DFT(xn, N);
k = 0:N-1;
n = 0:length(xn)-1;

% displaying
disp('Signal: ');
disp(xn);
disp('N: ');
disp(N);
disp('N point DFT of Given Signal');
disp(Xk);

% setting up color codes 
lightgreen = 1/255*[221 233 226];
violet = 1/255*[187, 0, 111];
darkGreen = 1/255*[0,104,87];
red = 1/255*[185, 0, 68];
yellow = 1/255*[199, 171, 0];

% plotting
H = figure(6);
set(gcf,'color', lightgreen, 'Position',  [100, 50, 600, 700]);

subplot(4,1,1);
stem(n, xn, '*', 'color', violet, 'LineWidth',1);
xlabel('Sample');
ylabel('Amp');
title('x(n): [1 1 1 0]');
grid on;
xlim([-4 12]);
ylim([-1 2]);

subplot(4,1,2);
stem(k, Xk, '*', 'color', darkGreen, 'LineWidth',1);
xlabel('Sample');
ylabel('X[K]');
title('DFT of x(n): X(K)');
grid on;
xlim([-4 12]);
ylim([-1 4]);

subplot(4,1,3);
stem(k, absX, '*', 'color', yellow, 'LineWidth',1);
xlabel('k');
ylabel('|Xk|');
title('Magnitude Plot: X(K)');
grid on;
xlim([-4 12]);
ylim([-1 4]);

subplot(4,1,4);
stem(k, angleX, '*', 'color', violet, 'LineWidth',1);
xlabel('k');
ylabel('Angle(Xk)');
title('Phase Plot X(K)');
grid on;
xlim([-4 12]);
ylim([-2 2]);

% saving figure
%exportgraphics(H,'DFT.png','Resolution',900, 'BackgroundColor', lightgreen)
