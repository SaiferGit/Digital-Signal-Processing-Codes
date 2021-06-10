clc;
close all;
clear all;

%Corrrr = xcorr([1 2 3 4], [4 3 2 1])
% input sequences
x = [1 2 -3]; % input('enter sequence 1: ');
h = [4 1 -2 5]; % input('enter sequence 2: ');

% folding h
foldedh = fliplr(h);

% calculating conv between x and folded h
y = Convolution(x, foldedh)

% setting up color codes 
lightgreen = 1/255*[221 233 226];
violet = 1/255*[187, 0, 111];
pinkinsh = 1/255*[0,104,87];
red = 1/255*[185, 0, 68];
yellow = 1/255*[199, 171, 0];

% ploting x, h, y using user defined function
n = 0:8;
H = figure(4);
set(gcf,'color', lightgreen, 'Position',  [100, 50, 400, 500]);

subplot(3,1,1);
stem(x, '*', 'color', violet, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Amp');
title('Sequence 1: [1 2 -3]');
grid on;
xlim([-8 8]);
ylim([-6 6]);

subplot(3,1,2);
stem(h, '*', 'color', pinkinsh, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Amp');
title('Sequence 2: [4 1 -2 5]');
grid on;
xlim([-8 8]);
ylim([-6 6]);

subplot(3,1,3);
stem(y, '*', 'color', yellow, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Y[n]');
title('Cross Correlation O/p');
grid on;
xlim([-8 8]);
ylim([-20 20]);

% saving figure
%exportgraphics(H,'Cross Correlation.png','Resolution',900, 'BackgroundColor', lightgreen)

