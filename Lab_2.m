clc;
close all;
clear all;

% convolution of given sequences
x = input('enter sequence 1: ');
h = input('enter sequence 2: ');

% calculating length
lenx = length(x);
lenh = length(h);

% output array
leny = lenx + lenh - 1;
y = zeros(1, leny);

% padding
X = [x, zeros(1,lenh)];
H = [h, zeros(1,lenx)];
conv(x,h)
for i = 1:leny
    for j = 1:lenx
        if (i-j+1) > 0
            y(i)= y(i) + X(j) * H(i-j+1);
        end
    end
end

% ploting x, h, y using user defined function
StemPlot(x, h, y, 'Convolution O/p');

