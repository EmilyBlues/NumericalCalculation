function[x, k, eps] = SOR(A, b, w)
    M = 200;
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
    if(w < 0 || w > 2)
        disp('�ɳ����ӷ�Χ����');
        return
    end
    D = diag(diag(A));
    L = -tril(A, -1);
    U = -triu(A, 1);
    B = inv(D - L * w) * ((1 - w) * D + w * U);
    f = w * inv(D - L * w) * b; 
    if vrho(B) > 1
        disp('���������װ뾶����1��������');
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
            disp('Warning: ����̫��Σ����ܲ�����');
            return
        end
    end
    k
end