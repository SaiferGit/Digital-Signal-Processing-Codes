clc;
close all;
clear all;
warning('off','all');

% taking input

x = [1 2 3 4 5 6 7 8 9 10 11 12]; %input('Enter the sequence: ');
N = 16; %input('Enter DFT point N: ');

% break down input into even and odd components

%x = [x zeros(1, N-length(x))]
if length(x) < N
   x = [x zeros(1, N-length(x))]
end
disp(x);
disp(N);

xeven = x(1:2:N); % even components
xodd = x(2:2:N); % odd components

disp(xeven);
disp(xodd);

% calculate DFT of these components
F1 = DFT(xeven, length(xeven));
F2 = DFT(xodd, length(xodd));


% calculating X
%X = F1 + G2
for k = 0: (N/2)-1
    X(k+1) = F1(k+1) + exp(-2*pi*k*1j/N) * F2(k+1); %WNk(k+1)*F2(k+1);
    X(k+1+(N/2)) = F1(k+1) - exp(-2*pi*k*1j/N) * F2(k+1);%WNk(k+1)*F2(k+1);
end
X

libraryDFT = fft([1 2 3 4 5 6 7 8 9 10 11 12], 16);
libraryDFT

if round(X) == round(libraryDFT)
    disp('Our calculated FFT matched with Library Function results');
else
    disp('Our calculated FFT DID NOT matched with Library Function results');
end