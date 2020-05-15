function [binsFrequencias] = mediaFrequenciasAtividade(dados,fs,atividade,eixo,binWidth)
    %1-transformar cada segmento de uma atividade
    %2-percorrer os valores das frequencias obtidas e coloca-los no balde
    %de frequencia correspondente
    %profit??
    
    
    binsFrequencias=[-fs/2:binWidth:fs/2-binWidth,1]; %baldes e frequencias
    binsFrequencias=binsFrequencias';   
    binsFrequencias(1:end,2)=0;
    binsFrequencias(1:end,3)=0;
    for i=1:length(dados{eixo}{atividade})            
        segmento=dados{eixo}{atividade}{i};
        segmento=detrend(segmento);
        [freq,amp]=transFourierDiscreta(segmento,fs);
        for j=1:length(freq)
            frequencia=freq(j);
            amplitude=amp(j);
            
            
            for k=1:length(binsFrequencias)-1
                if(frequencia>=binsFrequencias(k) && frequencia<binsFrequencias(k+1))
                    binFreq=binsFrequencias(k,1);
                    valor=binsFrequencias(k,2);
                    count=binsFrequencias(k,3);
                    binsFrequencias(k,3)=count+1;
                    binsFrequencias(k,2)=(valor+amplitude)/binsFrequencias(k,3);
                    break;
                end
            end
        end
        
    end
        
    
end

