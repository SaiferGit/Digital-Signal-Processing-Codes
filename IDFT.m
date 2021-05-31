function [xn, absxn, anglexn] = IDFT(Xk)
    N = length(Xk);
    xn = zeros(1, N);
    for n = 0:N-1
        for k = 0:N-1
            xn(n+1) = xn(n+1) + (1/N)* Xk(k+1) * exp((1i*2*pi*k*n)/N);
        end
    end
    
    xn = round(xn); % remove imaginary part
    xn = nonzeros(xn'); % remove zero
    absxn = abs(xn);
    anglexn = angle(xn);
end