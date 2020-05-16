function [media,desvioPadrao] = calcularFrequenciaAndar(dados,fs,atividade,eixo)
    arrayFrequencias=[];
    media=0;
    desvioPadrao=0;
    
    for i=1:length(dados{eixo}{atividade}) %percorrer todos os segmentos de "Walking" no eixo X
        
         segmento=dados{eixo}{atividade}{i};
        
        
        [freq,amp]=transFourierDiscreta(segmento,fs);
        [maximo,indice]=max(amp);
        
        arrayFrequencias=[arrayFrequencias, melhorPixa(freq,amp)];
           
    end
    
    
    
    media=mean(arrayFrequencias);
    desvioPadrao=std(arrayFrequencias);
    
end

