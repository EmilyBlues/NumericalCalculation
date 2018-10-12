function [y, F] = CooleyTFFT()
    Fs = 100; %Ƶ��
    T = 1/Fs; %ʱ��
    L = 1024; %�źų���
    t = (0:L-1)*T;
    x = 5 + 7*sin(2*pi*15*t - 30*pi/180) + 3*sin(2*pi*40*t - 90*pi/180);
    y = x + randn(size(t));     %�������
    figure;
    plot(t,y)
    title('���������ź�')
    xlabel('ʱ��(s)')
    
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
    f = Fs/N*(0:1:N-1); %Ƶ��
    A = abs(F);     %��ֵ
    P = angle(F);   %��ֵ

    figure
    subplot(211);
    plot(f(1:N/2),A(1:N/2));   %����fft����ֵ�����ݽṹ���жԳ���,�������ֻȡǰһ��
    title('��ֵƵ��')
    xlabel('Ƶ��(Hz)')
    ylabel('��ֵ')
    subplot(212);
    plot(f(1:N/2),P(1:N/2));
    title('��λ��Ƶ')
    xlabel('Ƶ��(Hz)')
    ylabel('��λ')
end

function [Fk, Fkn] = my_fft_ele(x, N, k)
    if N==1
        Fk=x;
        Fkn=x;
        return;
    else
        x1=x(1:2:N-1);%����
        x2=x(2:2:N);%ż��
        F1=my_fft_ele(x1,N/2,k);
        F2=my_fft_ele(x2,N/2,k);
        Wkn=exp(-i*2*pi*(k-1)/N);
        Fk=F1+Wkn*F2;
        Fkn=F1-Wkn*F2;
    end
end