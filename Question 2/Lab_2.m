clc;
close all;
clear all;

% convolution of given sequences
x = [1 2 3 1]; %input('enter sequence 1: ');
h = [1 2 1 -1]; %input('enter sequence 2: ');

% calculating length
lenx = length(x);
lenh = length(h);

% output array
leny = lenx + lenh - 1;
y = zeros(1, leny);

% padding
X = [x, zeros(1,lenh)];
H = [h, zeros(1,lenx)];
conv(x,h);
for i = 1:leny
    for j = 1:lenx
        if (i-j+1) > 0
            y(i)= y(i) + X(j) * H(i-j+1);
        end
    end
end

% display
disp('Sequence 1: ');
disp(x);
disp('Sequence 1: ');
disp(h);
disp('Convolution of the sequences: ');
disp(y);

% setting up color codes 
lightgreen = 1/255*[221 233 226];
violet = 1/255*[187, 0, 111];
pinkinsh = 1/255*[0,104,87];
red = 1/255*[185, 0, 68];
yellow = 1/255*[199, 171, 0];


% ploting x and h
n = 0:8;
H = figure(3);
set(gcf,'color', lightgreen, 'Position',  [100, 50, 600, 700]);

subplot(3,1,1);
stem(x, '*', 'color', violet, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Amp');
title('x(n): [1 2 3 1]');
grid on;
xlim([-8 8]);
ylim([-1 4]);

subplot(3,1,2);
stem(h, '*', 'color', pinkinsh, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Amp');
title('h(n): [1 2 1 -1]');
grid on;
xlim([-8 8]);
ylim([-2 4]);

subplot(3,1,3);
stem(y, '*', 'color', yellow, 'LineWidth',1);
xlabel('Sample Points');
ylabel('Y[n]');
title('Convolution O/p');
grid on;
xlim([-8 8]);
ylim([-4 10]);

% saving figure
%exportgraphics(H,'Convolution.png','Resolution',900, 'BackgroundColor', lightgreen)
