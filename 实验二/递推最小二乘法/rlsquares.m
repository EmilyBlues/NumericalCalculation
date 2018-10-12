function[x] = rlsquares(A, b)
    temp = A(:, 1:10);
    tempB = b(1:10, 1);
    Gm = inv(temp'*temp);
    x = Gm*temp'*tempB;
    for i = 11:10000
        a = A(:, i);
        m = 1 + a'*Gm*a;
        x = x + Gm*a*inv(m)*(b(i)-a'*x);
        Gm = Gm-Gm*a*inv(m)*a'*Gm;
    end
    
end