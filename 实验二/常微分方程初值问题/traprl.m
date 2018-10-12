function[x, y] = traprl(a, b, h)
    x = a : h : b;
    y0 = 1;
    y(1) = y0;
    for n = 1 : length(x)-1
        y(n+1) = y(n) + h * (y(n) - 2 * x(n)/y(n));
        y(n+1) = y(n) + h / 2 * (y(n) - 2 * x(n)/y(n)) + h / 2 * (y(n+1) - 2 * x(n+1)/y(n+1));
    end
end