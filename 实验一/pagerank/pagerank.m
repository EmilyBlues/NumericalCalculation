function[x, c] = pagerank(D)
    E = 508837;
    n = 75888;
    eps = 10^(-5);
    for i = 1 : n
        temp = sum(D(: ,i));
        if(temp == 0 || temp == 1)
            continue;
        end
        D(:, i) = D(:, i) / temp;
        i
    end
    
    beta = 0.85;
    x = 1 / n * ones(n, 1);
    I = ones(n, 1);
    for k = 1: 1e+10
        newv = (1 - beta) * D * x + beta * 1/n * I;
        c = newv;
        if norm(newv - x) <= eps
            x = newv;
            break;
        end
        x = newv;
       % k
       % fprintf('%dth iter\n', k);
    end
    
    show = 500;
    nodes = 1:show;
    temp = x(1:show);
    bar(nodes, temp');
    title('pagerank result');
    xlabel('nodes');
    ylabel('PR value');
    fprintf('sum of all is: %d\n', sum(x));
end