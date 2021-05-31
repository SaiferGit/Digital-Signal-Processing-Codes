function [X, absXk, angleXk] = DFT(xn, N)

    L = length(xn);
    if N < L
        error('N must be greater than or equal to xn');
    end

    % if sequence L is less than N-point DFT, we need to pad it
    xn = [xn zeros(1, N-L)];
    X = zeros(1, N);

    for k = 0:N-1
        for n = 0:N-1
            X(k+1) = X(k+1) + xn(n+1) * exp(-(j*2*pi*k*n)/N);
        end
    end
    
    absXk = abs(X);
    angleXk = angle(X);
end