function [media,desvioPadrao] = calcularFrequenciaAndar(dados,fs,atividade,eixo)
    arrayFrequencias = [];
    
    for i=1:length(dados{eixo}{atividade}) %percorrer todos os segmentos de "Walking" no eixo X
        
        segmento = dados{eixo}{atividade}{i};              
        [freq,amp] = transFourierDiscreta(segmento, fs, 1);   
        arrayFrequencias = [arrayFrequencias, steps(freq,amp)];
           
    end
    
    media = mean(arrayFrequencias);
    desvioPadrao = std(arrayFrequencias);
    
end

