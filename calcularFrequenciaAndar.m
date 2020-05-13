function [media,desvioPadrao] = calcularFrequenciaAndar(dados,fs,eixo)
    arrayFrequencias=[];
    media=0;
    desvioPadrao=0;
    
    for i=1:length(dados{eixo}{1}) %percorrer todos os segmentos de "Walking" no eixo X
        
        segmento=dados{eixo}{1}{i};
        segmento=detrend(segmento);
        
        [freq,amp]=transFourierDiscreta(segmento,fs);
        plot(freq,amp);
        [maximo,indice]=max(amp);
        
        arrayFrequencias=[arrayFrequencias, abs(freq(indice))];
        
        
    end
    
    media=mean(arrayFrequencias);
    desvioPadrao=std(arrayFrequencias);
    spm=(1/media)*60;
end

