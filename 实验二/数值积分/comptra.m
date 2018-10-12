function[result] = comptra(a, b, n)
    h = (b - a)/n;
    sum = 0;
    for k = 1 : n-1
        sum = sum + sin(a+k.*h) / (a+k.*h);
    end
    result = (1 + 2*sum + sin(b)/b)*h/2;
end