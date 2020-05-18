function fiveo(ficheiro, num_fig)
    
    dados = load(ficheiro);
    dados = detrend(dados(1:end,3));
    
    [freq,a] = janelaFourier(dados,50,4,2,1);
    f = figure(num_fig);

    imagesc(length(a(1,1:end)),freq,a);

    ylabel("Frequencia(Hz)");
    xlabel("Janela STFT");
    
    barra = colorbar;
    ylabel(barra, 'Magnitude');

    f = figure(num_fig + 1);
    waterfall(a');
end

