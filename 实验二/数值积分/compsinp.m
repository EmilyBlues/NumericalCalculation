function[result] = compsinp(a, b, n)
    h = (b - a)/n;
    sum1 = 0;
    sum2 = 0;
    for i = 0 : n-1
        temp1 = a+(i+1/2).*h;
        sum1 = sum1 + sin(temp1)/temp1;
    end
    for j = 1 : n-1
        temp2 = a+j.*h;
        sum2 = sum2 + sin(temp2)/temp2;
    end
    result = h/6 * (1 + 4*sum1 + 2*sum2 + sin(b)/b);
end