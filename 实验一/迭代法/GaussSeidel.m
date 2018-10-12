function[x, k, eps] = GaussSeidel(A, b)
    M = 10000;
    [n, m] = size(A);
    len = length(b);
    if n ~= m
        disp('����A������������Ҫ���');
        return
    end
    if n ~= len
        disp('����A��������b��������Ҫ���');
        return
    end
    L = zeros(n, n);
    U = zeros(n, n);
    D = zeros(n, n);
    x0 = ones(n, 1);
    L = -tril(A, -1);
    U = -triu(A, 1);
    for i = 1 : n
        D(i, i) = A(i, i);
    end
    B = (D - L) \ U;
    g = (D - L) \ b;
    if vrho(B) > 1
        disp('���������װ뾶����1��������');
        return
    end
    k = 1;
    x = B * x0 + g;
    eps(k) = norm(x - x0, inf);
    while norm(x - x0, inf) > 10^(-4)
        x0 = x;
        x = B * x + g;
        k = k + 1;
        eps(k) = norm(x - x0, inf);
        if(k >= M)
            disp('Warning: ����̫��Σ����ܲ�����');
            return
        end
    end
end