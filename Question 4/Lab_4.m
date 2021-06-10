clc;
close all;
clear all;


% which is nothing but autocorrelation, correlation with itself
% input sequences
x = [1 2 3 4];

% folding h
foldedx = fliplr(x);

% calculating conv between x and folded h
y = Convolution(x, foldedx);

% checking with library fucntion
libCorr = xcorr(x, x);

% displaying
disp('Sequence: ');
disp(x);
disp('Autocorrelation: ');
disp(y);
disp('Autocorrelation Using Library Function');
disp(libCorr);

% setting up color codes 
lightgreen = 1/255*[221 233 226];
violet = 1/255*[187, 0, 111];
pinkinsh = 1/255*[0,104,87];
red = 1/255*[185, 0, 68];
yellow = 1/255*[199, 171, 0];

% ploting x and h
H = figure(5);
set(gcf,'color', lightgreen, 'Position',  [100, 100, 600, 550]);
subplot(2,1,1);
stem(x, '*', 'color', violet, 'LineWidth',1);
xlabel('Sample');
ylabel('Amp');
title('x(n): [1 2 3 4]');
grid on;
xlim([-8 8]);
ylim([-1 5]);


subplot(2,1,2);
stem(y, '*', 'color', pinkinsh, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Y[n]');
title('Autocorrelation O/p');
grid on;
xlim([-8 8]);
ylim([-1 31]);

% saving figure
exportgraphics(H,'Auto Correlation.png','Resolution',900, 'BackgroundColor', lightgreen)
