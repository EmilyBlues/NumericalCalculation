function [y, F] = CooleyTFFT()
    Fs = 100; %频率
    T = 1/Fs; %时间
    L = 1024; %信号长度
    t = (0:L-1)*T;
    x = 5 + 7*sin(2*pi*15*t - 30*pi/180) + 3*sin(2*pi*40*t - 90*pi/180);
    y = x + randn(size(t));     %添加噪声
    figure;
    plot(t,y)
    title('加噪声的信号')
    xlabel('时间(s)')
    
    sz = size(y);
    N = max(sz(1:2));
    if sz(1) > 1
        F = zeros(N, 1);
    end
    if sz(2) > 1
        F = zeros(1, N);
    end
    for k = 1 : N / 2
        [F(k), F(k+N/2)] = my_fft_ele(y, N, k);
    end
    f = Fs/N*(0:1:N-1); %频率
    A = abs(F);     %幅值
    P = angle(F);   %相值

    figure
    subplot(211);
    plot(f(1:N/2),A(1:N/2));   %函数fft返回值的数据结构具有对称性,因此我们只取前一半
    title('幅值频谱')
    xlabel('频率(Hz)')
    ylabel('幅值')
    subplot(212);
    plot(f(1:N/2),P(1:N/2));
    title('相位谱频')
    xlabel('频率(Hz)')
    ylabel('相位')
end

function [Fk, Fkn] = my_fft_ele(x, N, k)
    if N==1
        Fk=x;
        Fkn=x;
        return;
    else
        x1=x(1:2:N-1);%奇数
        x2=x(2:2:N);%偶数
        F1=my_fft_ele(x1,N/2,k);
        F2=my_fft_ele(x2,N/2,k);
        Wkn=exp(-i*2*pi*(k-1)/N);
        Fk=F1+Wkn*F2;
        Fkn=F1-Wkn*F2;
    end
end