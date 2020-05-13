function [mediaFrequencias] = mediaFrequenciasAtividade(dados,atividade,fs)
    media=[]
    
    for i=1:length(dados{1}{atividade})
        segmento=dados{1}{atividade}{i};
        [freq,amp]=transFourierDiscreta(segmento,fs);
    end


end

