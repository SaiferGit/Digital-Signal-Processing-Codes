clc;
close all;
clear all;
warning('off','all');

% taking input
signal = [1 2 3 4]; %input('Enter the sequence: ');
N = 18; %input('Enter DFT point N: ');

% cheking N
if (isprime(N))
    disp('Error: N can not be prime');     
else
    fact = factor(N);
    len = length(fact);
    L = fact(len);
    M = prod(fact(1:len-1));
end

% padding xn if N > xn
xn = [signal zeros(1, N-length(signal))];

% storing xn in 2D
x = zeros(L, M);
k = 0;

for l = 0:L-1
    for m = 0:M-1
        temp = m*L;
        idx  = temp + l;
        x(l+1,m+1) = xn(idx+1);
    end
end


X = zeros(L, M); % output matrix

for p = 0:L-1  % looping for X(p,q)
    for q = 0:M-1
        res = 0;
        for l = 0:L-1
            twiddleN = exp(-1j*2*pi*l*q/N);
            resTemp = 0;
            for m = 0:M-1
                resTemp = resTemp + (x(l+1, m+1)* exp(-1j*2*pi*m*q/M));
            end
            twiddleL = exp(-1j*2*pi*l*p/L);
            res = res + (twiddleN * resTemp * twiddleL);
        end
        X(p+1, q+1) = res;
    end
end
            
dft = reshape(X.',1,[]); % converting 2D array into 1D

libdft = fft(xn, N);

% displaying output
disp('Actual Signal: '); 
disp(signal);
disp('Signal with N pad: '); 
disp(xn);
disp('Signal in 2D: '); 
disp(x);
disp('DFT using Eqn: '); 
disp(dft);
disp('DFT using Library: '); 
disp(libdft);



%%% plotting 
h = figure(8); % handle
lightgreen = 1/255*[221 233 226];
violet = 1/255*[187, 0, 111];
pinkinsh = 1/255*[0,104,87];
red = 1/255*[185, 0, 68];
yellow = 1/255*[199, 171, 0];
n = 0:N-1;

set(gcf,'color', lightgreen, 'Position',  [100, 100, 600, 600]);

subplot(3,1,1);
stem(n, xn, '*', 'color', violet, 'LineWidth',1);
xlabel('Sample');
ylabel('Amp');
title('signal: [1 2 3 4]');
grid on;
xlim([-2 N+2]);
ylim([-1 5]);
shading flat;


subplot(3,1,2);
stem(n, dft, '*', 'Color', pinkinsh, 'LineWidth',1)
%plot(n, dft, '*', loyolagreen, 'LineWidth', 1);
xlabel('Sample points');
ylabel('DFT values');
title('DFT of xn (Using Eqn)');
grid on;
xlim([-2 N+2]);
ylim([-5 12]);

subplot(3,1,3);
stem(n, dft, '*', 'Color', red, 'LineWidth',1)
%plot(n, dft, '*', loyolagreen, 'LineWidth', 1);
xlabel('Sample points');
ylabel('DFT values');
title('DFT Using Library');
grid on;
xlim([-2 N+2]);
ylim([-5 12]);

% saving figure
exportgraphics(h,'Divide and Conq FFT.png','Resolution',900, 'BackgroundColor', lightgreen)
