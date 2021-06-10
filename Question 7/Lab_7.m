% FIR filter
% Find X(K) (DFT of x(n))
% Find H(K) (DFT of h(n))
% Y(K) = X(K)H(K)
% y(n) = IDFT{Y(K)}
clc;
close all;
clear all;
warning('off','all');

xn = [1 2 -1 5 6];
hn = [5 6 7];
N = 12;

% calculating length
L = length(xn);
M = length(hn);
lenyn = L+M-1;

% padding to lenyn
xn = [xn zeros(1, lenyn)];
hn = [hn zeros(1, lenyn)];
yn = zeros(1, lenyn);

if N < lenyn
    error('N must be greater than lenght of x(n) and h(n)');
end

% Find X(K) (DFT of x(n))
% Find H(K) (DFT of h(n))
% Y(K) = X(K)H(K)
% y(n) = IDFT{Y(K)}

Xk = DFT(xn, N);
Hk = DFT(hn, N);
Yk = Xk .* Hk;
yn = IDFT(Yk);

% cross validating ans by doing liner conv
linearConv = Convolution(xn, hn);

% display
disp('Sequence 1: ');
disp(xn);
disp('Sequence 2: ');
disp(hn);
disp('FIR Filter Response: ');
disp(yn);

if yn == linearConv
    disp('Your answer is right by maching with Linear Convolution');
else
    disp('Your answer is wrong by maching with Linear Convolution');
end

% setting up color codes 
lightgreen = 1/255*[221 233 226];
violet = 1/255*[187, 0, 111];
darkgreen = 1/255*[0,104,87];
red = 1/255*[185, 0, 68];
yellow = 1/255*[199, 171, 0];

% ploting 
n = 0:N-1;
H = figure(7);
set(gcf,'color', lightgreen, 'Position',  [100, 50, 600, 700]);

subplot(4,1,1);
stem(n, xn, '*', 'color', violet, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Amp');
title('x(n): [1 2 -1 5 6]');
grid on;
xlim([-8 10]);
ylim([-2 8]);

hx = 0:length(hn)-1;
subplot(4,1,2);
stem(hx, hn, '*', 'color', red, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Amp');
title('h(n): [5 6 7]');
grid on;
xlim([-8 10]);
ylim([-2 8]);

leny = 0:length(yn)-1;
subplot(4,1,3);
stem(leny, yn, '*', 'color', yellow, 'LineWidth',1);
xlabel('Sample Points');
ylabel('y(n)');
title('FIR Filter Response');
grid on;
xlim([-8 10]);
ylim([-10 80]);

subplot(4,1,4);
stem(leny, linearConv, '*', 'color', darkgreen, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Amp');
title('Linear Conv. for Cross Check');
grid on;
xlim([-8 10]);
ylim([-10 80]);

% saving figure
exportgraphics(H,'FIR Filter Response.png','Resolution',900, 'BackgroundColor', lightgreen)
