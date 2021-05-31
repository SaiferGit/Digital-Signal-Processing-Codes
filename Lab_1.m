% value at index 0 is 1, otherwise 0
% take a signal length -5 to 5
% 1*11 matrix, defining 1 at index 0 and 0 all other place
% by default subplot is 1,1,1.
% for continous we use Plot, for discrete we use stem
%axis([-5 5 -5 5]); setting min and max x and y


clc;
close all;
clear all;

% unit impulse
ix = -5:5;
delta_ix=[zeros(1,5), ones(1,1), zeros(1,5)];

% unit step
n = input('Enter n: ');
ux = 0:n-1;
uy = ones(1,n);

% unit ramp
urx = 0:n;

% exponential
a = input('Enter a: ');
ex = -n:n;
ey = a.^(ex);


% ploting
figure(1)
subplot(4,1,1);
stem(ix,delta_ix); % draws a line from x to y
title('UNIT Impulse');
xlabel('Amplitude');
ylabel('Time Sample');
grid on;

subplot(4,1,2);
stem(ux,uy);
title('UNIT Step');
xlabel('Amplitude');
ylabel('Time Sample');
grid on;

subplot(4,1,3);
stem(urx,urx);
title('UNIT Ramp');
xlabel('Amplitude');
ylabel('Time Sample');
grid on;

subplot(4,1,4);
stem(ex,ey);
title('Exponential');
xlabel('Amplitude');
ylabel('Time Sample');
grid on;
