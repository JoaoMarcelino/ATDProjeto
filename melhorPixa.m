function spm=melhorPixa(freq,amp)

    freq=freq(round(end/2):end);
    amp=amp(round(end/2):end);

    picos=findpeaks(amp);
    maximo=max(amp);
    threshold=maximo*0.8;
    
    novos=picos(picos>threshold);
    valor=novos(1);
    
    indice=find(amp==valor);
    frequencia=freq(indice);
    
    spm=frequencia*60;
    
  
end

