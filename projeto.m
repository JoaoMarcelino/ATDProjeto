close all;

organizadoPorAtividade=organizar(["acc_exp41_user20","acc_exp42_user21","acc_exp43_user21","acc_exp44_user22","acc_exp45_user22","acc_exp46_user23","acc_exp47_user23","acc_exp48_user24","acc_exp49_user24","acc_exp50_user25"],"labels");

%plotBonito("./PL5/acc_exp41_user20.txt","./PL5/labels.txt",1,50,3);

%{
[mediaAndarX,desvioPadraoAndarX] = calcularFrequenciaAndar(organizadoPorAtividade,50,1,1)
[mediaAndarY,desvioPadraoAndarY] = calcularFrequenciaAndar(organizadoPorAtividade,50,1,2)
[mediaAndarZ,desvioPadraoAndarZ] = calcularFrequenciaAndar(organizadoPorAtividade,50,1,3)

[mediaUpX,desvioPadraoUpX] = calcularFrequenciaAndar(organizadoPorAtividade,50,2,1)
[mediaUpY,desvioPadraoUpY] = calcularFrequenciaAndar(organizadoPorAtividade,50,2,2)
[mediaUpZ,desvioPadraoUpZ] = calcularFrequenciaAndar(organizadoPorAtividade,50,2,3)


[mediaDownX,desvioPadraoDownX] = calcularFrequenciaAndar(organizadoPorAtividade,50,3,1)
[mediaDownY,desvioPadraoDownY] = calcularFrequenciaAndar(organizadoPorAtividade,50,3,2)
[mediaDownZ,desvioPadraoDownZ] = calcularFrequenciaAndar(organizadoPorAtividade,50,3,3)

%}

%variasJanelas(organizadoPorAtividade{2}{5}{2}, 50 ,1, 1);
%variasJanelas(organizadoPorAtividade{2}{7}{2}, 50, 2, 1);


[especificidade,sensibilidade]=sense(["acc_exp41_user20","acc_exp42_user21","acc_exp43_user21","acc_exp44_user22","acc_exp45_user22","acc_exp46_user23","acc_exp47_user23","acc_exp48_user24","acc_exp49_user24","acc_exp50_user25"],"labels",50,65,144,2)

%{
[freq,amp]=transFourierDiscreta(organizadoPorAtividade{2}{1}{3},50,0);
figure(5);
plot(freq,amp);
title("Andar");


[freq,amp]=transFourierDiscreta(organizadoPorAtividade{2}{2}{3},50,0);
figure(6);
plot(freq,amp);
title("Andar Up");

[freq,amp]=transFourierDiscreta(organizadoPorAtividade{2}{3}{3},50,0);
figure(7);
plot(freq,amp);
title("Andar Down");
%}



%{
dados=load("./PL5/acc_exp41_user20.txt");
dados=detrend(dados(1:end,3));
[freq,a] = janelaFourier(dados,50,4,2,1);
f=figure(10);

imagesc(length(a(1,1:end)),freq,a);

ylabel("Frequência(Hz)");
xlabel("Janela STFT");
barra=colorbar;

ylabel(barra, 'Magnitude');

f=figure(11);
waterfall(a');


%}





