function [media,desvioPadrao] = calcularFrequenciaAndar(dados,fs,eixo)
    arrayFrequencias=[];
    media=0;
    desvioPadrao=0;
    
    for i=1:length(dados{2}{1}) %percorrer todos os segmentos de "Walking" no eixo X
        segmento=dados{2}{1}{i};
        [freq,amp]=transFourierDiscreta(segmento,fs);
        [maximo,indice]=max(amp);
        amp(indice)=0;
        [maximo,indice]=max(amp);
        arrayFrequencias=[arrayFrequencias, abs(freq(indice))]
        
    end
    
    media=mean(arrayFrequencias);
    desvioPadrao=std(arrayFrequencias);
    
end

