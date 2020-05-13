function [media,desvioPadrao] = calcularFrequenciaAndar(dados,fs,atividade,eixo)
    arrayFrequencias=[];
    media=0;
    desvioPadrao=0;
    
    for i=1:length(dados{eixo}{atividade}) %percorrer todos os segmentos de "Walking" no eixo X
        
        segmento=dados{eixo}{atividade}{i};
        segmento=detrend(segmento);
        
        [freq,amp]=transFourierDiscreta(segmento,fs);
        plot(freq,amp);
        [maximo,indice]=max(amp);
        
        arrayFrequencias=[arrayFrequencias, abs(freq(indice))*60];
           
    end
    
    
    
    media=mean(arrayFrequencias);
    desvioPadrao=std(arrayFrequencias);
    
end

