clc;
close all;
clear all;

Corrrr = xcorr([1 2 3 4], [1 2 3 4]) 
% which is nothing but autocorrelation, correlation with itself
% input sequences
x = input('enter sequence 1: ');

% folding h
foldedx = fliplr(x);

% calculating conv between x and folded h
y = Convolution(x, foldedx);


% ploting x and h
figure(2)
subplot(2,1,1);
stem(x);
xlabel('Sample');
ylabel('Amp');
title('x(n)');
grid on;


subplot(2,1,2);
stem(y);
xlabel('---------> n');
ylabel('Y[n]');
title('Autocorrelation O/p');
grid on;
