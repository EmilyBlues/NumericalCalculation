function[result, num] = dichotomy(a, b)
    tic
    x1 = a;
    x2 = b;
    prec = 5 * 10^(-7);
    resTemp = zeros(1,10);
    count = zeros(1,10);
    i = 1;
    while (x2 - x1) > prec
        resTemp(i) = x2 - x1;
        temp = (x2 + x1) / 2;
        if (temp * temp - 115) > 0
            x2 = temp;
        else
            x1 = temp;
        end
        t2 = toc;
        count(i) = t2;
        i = i + 1;
    end
    result = (x1 + x2) / 2;
    num = i;
    plot(count, resTemp, 'o');
    hold on
    plot(count, resTemp);
end