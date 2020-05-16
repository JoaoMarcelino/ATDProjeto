close all;
%{
acc_exp41_user20 = load("./PL5/acc_exp41_user20.txt");
acc_exp42_user21 = load("./PL5/acc_exp42_user21.txt");
acc_exp43_user21 = load("./PL5/acc_exp43_user21.txt");
acc_exp44_user22 = load("./PL5/acc_exp44_user22.txt");
acc_exp45_user22 = load("./PL5/acc_exp45_user22.txt");
acc_exp46_user23 = load("./PL5/acc_exp46_user23.txt");
acc_exp47_user23 = load("./PL5/acc_exp47_user23.txt");
acc_exp48_user24 = load("./PL5/acc_exp48_user24.txt");
acc_exp49_user24 = load("./PL5/acc_exp49_user24.txt");
acc_exp50_user25 = load("./PL5/acc_exp50_user25.txt");
%}


organizadoPorAtividade=organizar(["acc_exp41_user20","acc_exp42_user21","acc_exp43_user21","acc_exp44_user22","acc_exp45_user22","acc_exp46_user23","acc_exp47_user23","acc_exp48_user24","acc_exp49_user24","acc_exp50_user25"],"labels");

plotBonito("./PL5/acc_exp41_user20.txt","./PL5/labels.txt",1,50,3);

[mediaAndarX,desvioPadraoAndarX] = calcularFrequenciaAndar(organizadoPorAtividade,50,1,1)
[mediaAndarY,desvioPadraoAndarY] = calcularFrequenciaAndar(organizadoPorAtividade,50,1,2)
[mediaAndarZ,desvioPadraoAndarZ] = calcularFrequenciaAndar(organizadoPorAtividade,50,1,3)

[mediaUpX,desvioPadraoUpX] = calcularFrequenciaAndar(organizadoPorAtividade,50,2,1)
[mediaUpY,desvioPadraoUpY] = calcularFrequenciaAndar(organizadoPorAtividade,50,2,2)
[mediaUpZ,desvioPadraoUpZ] = calcularFrequenciaAndar(organizadoPorAtividade,50,2,3)

[mediaDownX,desvioPadraoDownX] = calcularFrequenciaAndar(organizadoPorAtividade,50,3,1)
[mediaDownY,desvioPadraoDownY] = calcularFrequenciaAndar(organizadoPorAtividade,50,3,2)
[mediaDownZ,desvioPadraoDownZ] = calcularFrequenciaAndar(organizadoPorAtividade,50,3,3)


[especificidade,sensibilidade]=sense(["acc_exp41_user20","acc_exp42_user21","acc_exp43_user21","acc_exp44_user22","acc_exp45_user22","acc_exp46_user23","acc_exp47_user23","acc_exp48_user24","acc_exp49_user24","acc_exp50_user25"],"labels",50,70,140,2)




dados=load("./PL5/acc_exp41_user20.txt");
dados=detrend(dados(1:end,3));
[freq,a] = janelaFourier(dados,50,2,1,1);
figure(3);
imagesc(20*log10(a)');



%{
[media,desvioPadrao] = calcularFrequenciaAndar(organizadoPorAtividade,50,12,3);
media
desvioPadrao
%[binsFrequencias] = mediaFrequenciasAtividade(organizadoPorAtividade,50,12,2,0.05);
%plot(binsFrequencias(1:end,1),binsFrequencias(1:end,2));
%}

%{
[row, collumn] = find(labels(:,1)==41);
disp(row);
figure(1);
hold on 
plot(acc_exp41_user20);
for i = 1:length(row)
    a = plot((tempos(i,2): tempos(i,3)),acc_exp41_user20(tempos(i,2): tempos(i,3)),"DisplayName",int2str(tempos(i,1)));
end
legend
hold off
%}

