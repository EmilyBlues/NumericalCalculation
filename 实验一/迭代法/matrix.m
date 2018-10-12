function[A] = matrix(n)
    A = zeros(n, n);
    A = unifrnd(0, 1, n, n);
    for i = 1 : n
        A(i, i) = sum(A(i, 1:n));
    end
end