close all;

% exercicio 2
organizadoPorAtividade=organizar(["acc_exp41_user20","acc_exp42_user21","acc_exp43_user21","acc_exp44_user22","acc_exp45_user22","acc_exp46_user23","acc_exp47_user23","acc_exp48_user24","acc_exp49_user24","acc_exp50_user25"],"labels");

% exercicio 3
plotBonito("./PL5/acc_exp41_user20.txt","./PL5/labels.txt",1,50,3);

% exercicio 4.1 (comentar linha 44 janelaFourier.m, senao apenas representa metade)
variasJanelas(organizadoPorAtividade{2}{7}{2}, 50, 2, 1);

% exercicio 4.2
[mediaAndarX,desvioPadraoAndarX] = calcularFrequenciaAndar(organizadoPorAtividade,50,1,1);
[mediaAndarY,desvioPadraoAndarY] = calcularFrequenciaAndar(organizadoPorAtividade,50,1,2);
[mediaAndarZ,desvioPadraoAndarZ] = calcularFrequenciaAndar(organizadoPorAtividade,50,1,3);

[mediaUpX,desvioPadraoUpX] = calcularFrequenciaAndar(organizadoPorAtividade,50,2,1);
[mediaUpY,desvioPadraoUpY] = calcularFrequenciaAndar(organizadoPorAtividade,50,2,2);
[mediaUpZ,desvioPadraoUpZ] = calcularFrequenciaAndar(organizadoPorAtividade,50,2,3);

[mediaDownX,desvioPadraoDownX] = calcularFrequenciaAndar(organizadoPorAtividade,50,3,1);
[mediaDownY,desvioPadraoDownY] = calcularFrequenciaAndar(organizadoPorAtividade,50,3,2);
[mediaDownZ,desvioPadraoDownZ] = calcularFrequenciaAndar(organizadoPorAtividade,50,3,3);

% exercicio 4.3
[especificidade,sensibilidade] = sense(["acc_exp41_user20","acc_exp42_user21","acc_exp43_user21","acc_exp44_user22","acc_exp45_user22","acc_exp46_user23","acc_exp47_user23","acc_exp48_user24","acc_exp49_user24","acc_exp50_user25"],"labels",50,65,144,2);

% exercicio 4.4
exercicio44("acc_exp41_user20","labels",50);

% exercicio 4.5
exercicio45();

% exercicio 5
fiveo("./PL5/acc_exp41_user20.txt", 6);





