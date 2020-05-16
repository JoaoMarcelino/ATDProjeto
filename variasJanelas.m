function [] = variasJanelas(atividade,fs,tempoJanela,tempoSobreposicao)

% PROBABLY FOR

figure();
hold on

subplot(2,2,1);
[frequencias,arrayJanelas] = janelaFourier(detrend(atividade),fs,tempoJanela,tempoSobreposicao,0);
plot(frequencias',arrayJanelas(1:end,1));
title("DTF");

subplot(2,2,2);
[frequencias,arrayJanelas] = janelaFourier(detrend(atividade),fs,tempoJanela,tempoSobreposicao,1);
plot(frequencias',arrayJanelas(1:end,1));
title("Hamming");

subplot(2,2,3);
[frequencias,arrayJanelas] = janelaFourier(detrend(atividade),fs,tempoJanela,tempoSobreposicao,2);
plot(frequencias',arrayJanelas(1:end,1));
title("Hann");

subplot(2,2,4);
[frequencias,arrayJanelas] = janelaFourier(detrend(atividade),fs,tempoJanela,tempoSobreposicao,3);
plot(frequencias',arrayJanelas(1:end,1));
title("Blackman");

hold off