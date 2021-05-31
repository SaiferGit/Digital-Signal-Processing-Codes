function plt = StemPlot(x, h, y, ttL)
    % ploting x and h
    figure(2)
    subplot(3,1,1);
    stem(x);
    xlabel('Sample');
    ylabel('Amp');
    title('x(n)');
    grid on;

    subplot(3,1,2);
    stem(h);
    xlabel('Sample');
    ylabel('Amp');
    title('h(n)');
    grid on;

    subplot(3,1,3);
    stem(y);
    xlabel('---------> n');
    ylabel('Y[n]');
    title(ttL);
    grid on;
end