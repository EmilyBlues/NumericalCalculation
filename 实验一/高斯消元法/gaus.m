function [RA,RB,n,X] = gaus(A, b)
    B=[A b]; 
    n = length(b);
    RA = rank(A);
    RB = rank(B);
    zhica = RB - RA;
    if zhica > 0
        disp('RA != RB, 此方程无解');
        return
    end
    if RA == RB
        if RA == n
            disp('RA = RB, 此方程只有一个解');
            X = zeros(n, 1);
            C = zeros(1, n+1);
            for p = 1 : n-1
                for k = p+1 : n
                    m = B(k, p)/B(p, p);
                    B(k, p:n+1) = B(k, p:n+1) - m * B(p, p:n+1);
                end
            end
            b = B(1:n, n+1);
            A = B(1:n, 1:n);
            X(n) = b(n)/A(n, n);
            for q = n-1: -1 : 1
                X(q) = (b(q)-sum(A(q, q+1:n)*X(q+1:n)))/A(q, q);
            end
        else
            disp('RA=RB<n, 此方程有无穷多解');
        end
    end