function [frequencias,arrayJanelas] = janelaFourier(atividade,fs,tempoJanela,tempoSobreposicao,modo)
    Tframe = tempoJanela; % largura da janela de an�lise em s
    Toverlap = tempoSobreposicao; % sobreposi�ao das janelas em s
    Nframe = round(Tframe*fs); % n�mero de amostras na janela
    Noverlap = round(Toverlap*fs); % n�mero de amostras sobrepostas na janela
    N = numel(atividade);
    if(modo==1)
        h = hamming(Nframe); % janela de hamming
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
        if(modo==1)
            x_frame = atividade(ii:ii+Nframe-1).*h;
        end
        
        % obter a magnitude da fft do sinal
        m_X_frame = abs(fftshift(fft(x_frame)));


        nframes = nframes+1;

        frames=[frames, m_X_frame];
    end
    
    frequencias=f_frame;
    arrayJanelas=frames;
end

