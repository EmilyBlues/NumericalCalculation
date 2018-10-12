function[x, N, eps] = jacobi(A,b)
    M = 10000;
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
    D = zeros(n, n);
    L = zeros(n, n);
    U = zeros(n, n);
    G = zeros(n);
    d = ones(n, 1);

    x = zeros(n, 1);
    D = diag(diag(A));
    L = -tril(A, -1);
    U = -triu(A, 1);
    G = inv(D) * (L + U);
    if vrho(G) > 1
        disp('jacobi迭代法不收敛');
        return
    end
    d = inv(D) * b;
    N = 1;
    x1 = x;
    x2 = G * x + d;
    eps(N) = norm(x2 - x1, inf);
    while norm(x2 - x1, inf) > 10^(-4)
        x1 = x2;
        x2 = G * x2 + d;
        N = N + 1;
        eps(N) = norm(x2 - x1, inf);
    end
    x = x2;
end