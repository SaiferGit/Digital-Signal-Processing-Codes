% FIR filter
% Find X(K) (DFT of x(n))
% Find H(K) (DFT of h(n))
% Y(K) = X(K)H(K)
% y(n) = IDFT{Y(K)}
clc;
close all;
clear all;
warning('off','all');

xn = input('Enter a finite sequence: '); %[1 2 -1 5 6];
hn = input('Enter impulse response of FIR Filter: '); % [5 6 7];
N = input('Enter N: ');

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
yn = IDFT(Yk)

% cross validating ans by doing liner conv
linearConv = Convolution(xn, hn);

if yn == linearConv
    disp('Your answer is right by maching with Linear Convolution');
else
    disp('Your answer is wrong by maching with Linear Convolution');
end
