function[result, num] = stringCut(x0, x1)
    tic
    i = 1;
    resTemp = zeros(1, 10);
    count = zeros(1, 10);
    prec = 10^(-6);
    x2 = x1-(x1*x1 - 115)/(x1*x1 - x0*x0)*(x1-x0);
    if abs(x2) < 1
        eps = abs(x2 - x1);
    else 
        eps = abs(x2 - x1) / abs(x2);
    end
    resTemp(i) = eps;
    t = toc;
    count(i) = t;
    i = i + 1;
    x0 = x1;
    x1 = x2;
    while eps > prec
        x2 = x1-(x1*x1 - 115)/(x1*x1 - x0*x0)*(x1-x0);
        if abs(x2) < 1
            eps = abs(x2 - x1);
        else 
            eps = abs(x2 - x1) / abs(x2);
        end
        resTemp(i) = eps;
        t = toc;
        count(i) = t;
        i = i + 1;
        x0 = x1;
        x1 = x2;
    end
    result = x2;
    num = i;
    plot(count, resTemp, 'o');
    hold on
    plot(count, resTemp);
end