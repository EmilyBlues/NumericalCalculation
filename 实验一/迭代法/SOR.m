function[x, k, eps] = SOR(A, b, w)
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
    if(w < 0 || w > 2)
        disp('松弛因子范围不对');
        return
    end
    D = diag(diag(A));
    L = -tril(A, -1);
    U = -triu(A, 1);
    B = inv(D - L * w) * ((1 - w) * D + w * U);
    f = w * inv(D - L * w) * b; 
    if vrho(B) > 1
        disp('迭代矩阵谱半径大于1，不收敛');
        return
    end
    x0 = zeros(n, 1);
    x = B * x0 + f;
    k = 1;
    eps(k) = norm(x - x0, inf);
    while norm(x - x0, inf) > 10^(-4)
        x0 = x;
        x = B * x0 + f;
        k = k + 1;
        eps(k) = norm(x - x0, inf);
        if(k >= M)
            disp('Warning: 迭代太多次，可能不收敛');
            return
        end
    end
    k
end