% IDFT
clc;
close all;
clear all;
warning('off','all');

% input sequences for user defined DFT function
xn = [1 2 3 1];
lenxn = 0:length(xn)-1;
N = 12;
% sending xn and N to compute DFT
[Xk, absXk, angleXk] = DFT(xn, N);
n = 0:N-1;

% finding IDFT through user defined function
[xn, absxn, anglexn] = IDFT(Xk);

%%%% cross validate using Library func
libxK = fft(xn, N); % DFT
libxn = ifft(libxK, N);
libxn = nonzeros(round(libxn)'); %IDFT


%%% displaying to cross check
disp('Actual Signal: ');
disp(xn);
disp('DFT (Library Ans): ');
disp(libxK);
disp('DFT (User Defined Ans): ')
disp(Xk);
disp('IDFT (Library Ans): ')
disp(libxn);
disp('IDFT (User Defined Ans): ')
disp(xn);

% setting up color codes 
lightgreen = 1/255*[221 233 226];
violet = 1/255*[187, 0, 111];
darkgreen = 1/255*[0,104,87];
red = 1/255*[185, 0, 68];
yellow = 1/255*[199, 171, 0];

%%%%% ploting to cross check
H = figure(6);
set(gcf,'color', lightgreen, 'Position',  [100, 50, 500, 700]);


subplot(5,1,1);
stem(lenxn, xn, '*', 'color', violet, 'LineWidth',1);
xlabel('Sample');
ylabel('Amp');
title('x(n) - Actual Input');
grid on;
xlim([-2 14]);
ylim([-1 4]);

subplot(5,1,2);
stem(n, libxK, '*', 'color', yellow, 'LineWidth',1);
xlabel('Sample');
ylabel('X[K]');
title('DFT Using Library');
grid on;
xlim([-2 14]);
ylim([-5 10]);

subplot(5,1,3);
stem(n, Xk, '*', 'color', yellow, 'LineWidth',1);
xlabel('Sample');
ylabel('X[K]');
title('DFT Using Defined Function');
grid on;
xlim([-2 14]);
ylim([-10 10]);

subplot(5,1,4);
stem(lenxn, libxn, '*', 'color', darkgreen, 'LineWidth',1);
xlabel('DFT Point');
ylabel('x(n)');
title('IDFT Using Library');
grid on;
xlim([-2 14]);
ylim([-1 4]);

subplot(5,1,5);
stem(lenxn, xn, '*', 'color', darkgreen, 'LineWidth',1);
xlabel('DFT Point');
ylabel('x(n)');
title('IDFT Using Defined Function');
grid on;
xlim([-2 14]);
ylim([-1 4]);

% saving figure
exportgraphics(H,'IDFT.png','Resolution',900, 'BackgroundColor', lightgreen)
