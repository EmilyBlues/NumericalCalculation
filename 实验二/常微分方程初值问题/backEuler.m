function[x, y] = backEuler(a, b, h)
    x = a:h:b;
    x0 = 0;
    y0 = 1;
    y(1) = y0;
    for n = 1 : length(x)-1
        y(n+1) = y(n) + h * (y(n) - 2 * x(n)/y(n));
        y(n+1) = y(n) + h * (y(n+1) - 2* x(n+1)/y(n+1));
    end
end