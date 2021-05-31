% IDFT
clc;
close all;
clear all;
warning('off','all');

% input sequences for user defined DFT function
xn = input('Enter Sample sequences for DFT: '); % [1 2 3 4]
N = input('Enter no. of points for DFT: '); % 16
% sending xn and N to compute DFT
[Xk, absXk, angleXk] = DFT(xn, N);
n = 0:length(Xk);
% finding IDFT through user defined function
[xn, absxn, anglexn] = IDFT(Xk);

%%%% cross validate using Library func
libxK = fft(xn, N); % DFT
libxn = ifft(libxK, N);
libxn = nonzeros(round(libxn)'); %IDFT


%%% displaying to cross check
disp('DFT (Library Ans): ');
disp(libxK);
disp('DFT (User Defined Ans): ')
disp(Xk);
disp('IDFT (Library Ans): ')
disp(libxn);
disp('IDFT (User Defined Ans): ')
disp(xn);

%%%%% ploting to cross check
fg = figure(6);
fg.WindowState = 'maximized';
subplot(5,1,1);
stem(xn);
xlabel('Sample');
ylabel('Amp');
title('x(n) - Actual Input');
grid on;

subplot(5,1,2);
stem(libxK);
xlabel('Sample');
ylabel('X[K]');
title('DFT Using Library');
grid on;

subplot(5,1,3);
stem(Xk);
xlabel('Sample');
ylabel('X[K]');
title('DFT Using Defined Function');
grid on;

subplot(5,1,4);
stem(libxn);
xlabel('DFT Point');
ylabel('x(n)');
title('IDFT Using Library');
grid on;

subplot(5,1,5);
stem(xn);
xlabel('DFT Point');
ylabel('x(n)');
title('IDFT Using Defined Function');
grid on;