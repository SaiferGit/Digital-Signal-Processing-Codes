clc;
close all;
clear all;

%Corrrr = xcorr([1 2 3 4], [4 3 2 1])
% input sequences
x = input('enter sequence 1: ');
h = input('enter sequence 2: ');

% folding h
foldedh = fliplr(h);

% calculating conv between x and folded h
y = Convolution(x, foldedh);

% ploting x, h, y using user defined function
StemPlot(x, h, y, 'Cross Correlation O/p');

