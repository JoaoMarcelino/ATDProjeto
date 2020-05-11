function [f,amplitude] = transFourierDiscreta(sinal,fs)
    N=numel(sinal);
    Ts=1/fs;
    X=fftshift(fft(sinal));
    
    if (mod(N,2)==0)
        % se o número de pontos do sinal for par
        f = -fs/2:fs/N:fs/2-fs/N;
    else
        % se o número de pontos do sinal for ímpar
        f = -fs/2+fs/(2*N):fs/N:fs/2-fs/(2*N);
    end
    
    amplitude=abs(X);
    plot(f,amplitude);
    
end

