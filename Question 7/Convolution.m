function [y] = Convolution(x, h)
    % calculating length
    lenx = length(x);
    lenh = length(h);

    % output array
    leny = lenx + lenh - 1;
    y = zeros(1, leny);

    % padding
    X = [x, zeros(1,lenh)];
    H = [h, zeros(1,lenx)];
    for i = 1:leny
        for j = 1:lenx
            if (i-j+1) > 0
                y(i)= y(i) + X(j) * H(i-j+1);
            end
        end
    end
    y = nonzeros(y');
end
