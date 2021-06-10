clc;
close all;
clear all;
warning('off','all');

% taking input

x = [1 2 3 4]; %input('Enter the sequence: ');
N = 11; %input('Enter DFT point N: ');

% checking N, N mod 2 must be 0 which means even 
if rem(N,2) ~= 0
    N = N+1
end
%N 

% break down input into even and odd components

if length(x) < N
   x = [x zeros(1, N-length(x))]
end
disp(x);
disp(N);

xeven = x(1:2:N); % even components
xodd = x(2:2:N); % odd components


% calculate DFT of these components
F1 = DFT(xeven, length(xeven));
F2 = DFT(xodd, length(xodd));


% calculating X
%X = F1 + G2
for k = 0: (N/2)-1
    twiddle_N = exp(-2*pi*k*1j/N)
    X(k+1) = F1(k+1) + twiddle_N * F2(k+1); %WNk(k+1)*F2(k+1);
    X(k+1+(N/2)) = F1(k+1) - twiddle_N * F2(k+1);%WNk(k+1)*F2(k+1);
end
disp('Radix-2 FFT Ans: ');
disp(X);

libraryDFT = fft(x, N);
disp('DFT Using Library: ');
disp(libraryDFT);

if round(X) == round(libraryDFT)
    disp('Our calculated FFT matched with Library Function results');
else
    disp('Our calculated FFT DID NOT matched with Library Function results');
end

% setting up color codes 
lightgreen = 1/255*[221 233 226];
violet = 1/255*[187, 0, 111];
darkgreen = 1/255*[0,104,87];
red = 1/255*[185, 0, 68];
yellow = 1/255*[199, 171, 0];

% ploting 
n = 0:8;
H = figure(10);
set(gcf,'color', lightgreen, 'Position',  [100, 50, 600, 700]);


Grapx = 0:length(x)-1;
subplot(3,1,1);
stem(Grapx, x, '*', 'color', violet, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Amp');
title('x(n): [1 2 3 4]');
grid on;
xlim([-5 N+1]);
ylim([-5 10]);

subplot(3,1,2);
stem(Grapx, X, '*', 'color', yellow, 'LineWidth',1);
xlabel('Sample Points');
ylabel('X(K)');
title('FFT Using Radix-2');
grid on;
xlim([-5 N+1]);
ylim([-10 15]);

subplot(3,1,3);
stem(Grapx, libraryDFT, '*', 'color', darkgreen, 'LineWidth',1);
xlabel('Sample Points');
ylabel('X(K)');
title('FFT Using Library Function');
grid on;
xlim([-5 N+1]);
ylim([-10 15]);

% saving figure
exportgraphics(H,'Radix-2 FFT.png','Resolution',900, 'BackgroundColor', lightgreen)
