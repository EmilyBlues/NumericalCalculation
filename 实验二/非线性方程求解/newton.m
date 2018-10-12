function [result, num] = newton(x0)
    tic
    i = 1;
    resTemp = zeros(1, 10);
    count = zeros(1, 10);
    x1 = x0/2 + 115/(2 * x0);
    prec = 10^(-6);
    if abs(x1) < 1
        eps = abs(x1 - x0);
    else 
        eps = abs(x1 - x0) / abs(x1);
    end
    resTemp(i) = eps;
    t = toc;
    count(i) = t;
    i = i + 1;
    x0 = x1;
    while eps > prec
        x1 = x0/2 + 115/(2 * x0);
        if abs(x1) < 1
            eps = abs(x1 - x0);
        else 
            eps = abs(x1 - x0) / abs(x1);
        end
        resTemp(i) = eps;
        t = toc;
        count(i) = t;
        i = i + 1;
        x0 = x1;
    end
    num = i;
    result = x1;
    plot(count, resTemp, 'o');
    hold on
    plot(count, resTemp);