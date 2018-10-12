function[x, y] = forwardEular(a, b, h)
    x = a:h:b;
    y0 = 1;
    y(1) = y0;
    for n = 1 : length(x)-1
        y(n+1) = y(n) + h * (y(n) - 2 * x(n)/y(n));
    end
end