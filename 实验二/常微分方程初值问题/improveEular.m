function[x, y] = improveEular(a, b, h)
    x = a:h:b;
    y0 = 1;
    y(1) = y0;
    for n = 1 : length(x)-1
        yp = y(n) + h * (y(n) - 2 * x(n)/y(n));
        yc = y(n) + h * (yp - 2 * x(n)/yp);
        y(n+1) = 1 / 2 * (yp + yc);
    end
end