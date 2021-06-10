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
ix = -7:7;
delta_ix=[zeros(1,7), ones(1,1), zeros(1,7)];

% unit step
n = 7;
ux = 0:n;
uy = ones(1,n+1);

% unit ramp
urx = 0:n;

% exponential
a = 0.5;
ex = -n:n;
ey1 = (1.25).^(ex);
ey2 = (0.7).^(ex);
ey3 = (-0.7).^(ex);
ey4 = (-1.25).^(ex);

%%%% displaying output
disp('Unit Impulse Signal:');
disp(delta_ix);
disp('Unit Step Signal:');
disp(uy);
disp('Unit Ramp Signal:');
disp(urx);
disp('Exponential Signal:');
disp('a>2:');
disp(ey1);
disp('0<a<1:');
disp(ey2);
disp('-1<a<0:');
disp(ey3);
disp('a<-1:');
disp(ey4);

% ploting

% setting up color codes
lightgreen = 1/255*[221 233 226];
violet = 1/255*[187, 0, 111];
pinkinsh = 1/255*[0,104,87];
red = 1/255*[185, 0, 68];
yellow = 1/255*[199, 171, 0];

h = figure(1);
set(gcf,'color', lightgreen, 'Position',  [100, 50, 600, 700]);


subplot(3,1,1);
stem(ix,delta_ix, '*', 'color', violet, 'LineWidth',1); % draws a line from x to y
title('UNIT Impulse');
ylabel('Amplitude');
xlabel('Time Sample');
grid on;
xlim([-8 8]);
ylim([-1 2]);

subplot(3,1,2);
stem(ux,uy, '*', 'color', pinkinsh, 'LineWidth',1);
title('UNIT Step');
ylabel('Amplitude');
xlabel('Time Sample');
grid on;
xlim([-8 8]);
ylim([-1 2]);

subplot(3,1,3);
stem(urx,urx, '*', 'color', red, 'LineWidth',1);
title('UNIT Ramp');
ylabel('Amplitude');
xlabel('Time Sample');
grid on;
xlim([-8 8]);
ylim([-1 8]);

h2 = figure(2);
set(gcf,'color', lightgreen, 'Position',  [100, 50, 600, 700]);

subplot(4,1,1);
stem(ex,ey1, '*', 'color', yellow, 'LineWidth',1);
title('Exponential: a>1');
ylabel('Amplitude');
xlabel('Time Sample');
grid on;
xlim([-8 8]);
ylim([-1 6]);

subplot(4,1,2);
stem(ex,ey2, '*', 'color', yellow, 'LineWidth',1);
title('Exponential: 0<a<1');
ylabel('Amplitude');
xlabel('Time Sample');
grid on;
xlim([-8 8]);
ylim([-1 15])

subplot(4,1,3);
stem(ex,ey3, '*', 'color', yellow, 'LineWidth',1);
title('Exponential: -1<a<0');
ylabel('Amplitude');
xlabel('Time Sample');
grid on;
xlim([-8 8]);
ylim([-15 15]);


subplot(4,1,4);
stem(ex,ey4, '*', 'color', yellow, 'LineWidth',1);
title('Exponential: a<-1');
ylabel('Amplitude');
xlabel('Time Sample');
grid on;
xlim([-8 8]);
ylim([-6 6]);

% saving figure
%exportgraphics(h,'Basic Signals.png','Resolution',900, 'BackgroundColor', lightgreen)
%exportgraphics(h2,'Different eponential signals.png','Resolution',900, 'BackgroundColor', lightgreen)

