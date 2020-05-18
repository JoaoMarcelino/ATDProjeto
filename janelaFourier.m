function [frequencias,arrayJanelas] = janelaFourier(atividade,fs,tempoJanela,tempoSobreposicao,modo)
    Ts=1/fs;
    Tframe = tempoJanela; % largura da janela de análise em s
    Toverlap =tempoSobreposicao; % sobreposiçao das janelas em s
    Nframe = round(Tframe*fs); % número de amostras na janela
    Noverlap = round(Toverlap*fs); % número de amostras sobrepostas na janela
    N = numel(atividade);
    
    if(modo==1)
        h = hamming(Nframe); % janela de hamming
    end
    if (modo == 2)
        h = hann(Nframe); % janela de hann
    end
    if (modo == 3)
        h = blackman(Nframe); % janela de blackman
    end
    
    
    if mod(Nframe, 2)==0
        f_frame = -fs/2:fs/Nframe:fs/2-fs/Nframe;
    else 
        f_frame = -fs/2+fs/(2*Nframe):fs/Nframe:fs/2-fs/(2*Nframe);
    end
    
    nframes = 0; % para guardar
    frames=[];
    
    for ii = 1:Nframe - Noverlap:N - Nframe
        % aplicar a janela ao sinal do tempo
        if(modo> 0 && modo < 4)
            x_frame = atividade(ii:ii+Nframe-1).*h;
        end
        
        if (modo == 0)
            x_frame = atividade(ii:ii+Nframe-1);
        end
        
    
        % obter a magnitude da fft do sinal
       
        m_X_frame = abs(fftshift(fft(x_frame)));
            
        m_X_frame=m_X_frame(round(end/2)+1:end);
        
        nframes = nframes+1;
        
        frames=[frames,m_X_frame];
    end
    
    frequencias=f_frame(round(end/2)+1:end);
    arrayJanelas=frames;
end

