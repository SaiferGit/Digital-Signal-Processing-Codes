clc;
close all;
clear all;
warning('off','all');

% taking input
xn = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]; %input('Enter the sequence: ');
N = 15; %input('Enter DFT point N: ');

L = 5;
M = 3;


n = length(xn);

% storing xn in 2D
x = zeros(L, M);
k = 0;
for m = 0:M-1
    for l = 0:L-1
        if k < n
            x(l+1, m+1) = xn(k+1);
            k = k + 1;
        else
            break
        end
    end
end
x

% M point dft calculation
% M point dft of L rows
F = zeros(L, M);
for l = 0:L-1
    for q = 0:M-1
        F(l+1,q+1) = F(l+1,q+1) + x(l+1, q+1) * (exp(-1j*2*pi*q)/M);
        
    end
end
F



% compute new rectangular array G(l,q)
G = zeros(L, M);
for l = 0:L-1
    for q = 0:M-1
        G(l+1, q+1) = G(l+1, q+1) + F(l+1, q+1) * (exp(-1j*2*pi*l*q)/N);
    end
end

G

% compute L point DFT
% L point DFT of M columns

X = zeros(L,M)

for q =  0:M-1
    for p = 0:L-1
        X(p+1, q+1) = X(p+1, q+1) + G(p+1, q+1) * (exp(-1j*2*pi*l*p)/L);
        
    end
end
X
absOfX = abs(X)
angleOfX = angle(X)

%anddd = fft([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15], 15);
%anddd
