function[x, k, eps] = CG(A, b)
     M = 200;
    [n, m] = size(A);
    len = length(b);
    if n ~= m
        disp('矩阵A行数与列数需要相等');
        return
    end
    if n ~= len
        disp('矩阵A的行数与b向量长度要相等');
        return
    end
    x0 = zeros(n, 1);
    r0 = b - A * x0;
    p0 = r0;
    k = 1;
    while abs(p0) > 10^(-4)
        if(abs(r0) < 10^(-4))
            break;
        end
        a0 = r0'*r0/(p0'*A*p0);
        x1 = x0 + a0 * p0;
        eps(k) = norm(x1 - x0, inf);
        r1 = r0 - a0 * A * p0;
        b0 = r1'*r1/(r0'*r0);
        p1 = r1 + b0 * p0;
        x0 = x1;
        r0 = r1;
        p0 = p1;
        k = k + 1;
    end
    x = x0;
end