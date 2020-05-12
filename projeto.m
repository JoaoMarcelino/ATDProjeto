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
labels = load("./PL5/labels.txt");
%activity_labels = read("activity_labels.txt");

organizadoPorAtividade=organizar(["acc_exp41_user20","acc_exp42_user21","acc_exp43_user21","acc_exp44_user22","acc_exp45_user22","acc_exp46_user23","acc_exp47_user23","acc_exp48_user24","acc_exp49_user24","acc_exp50_user25"],"labels");
[row, collumn] = find(labels(:,1)==41);
%disp(row);


plotAllActivities(organizadoPorAtividade,5);

tempos = labels(row,3:5);
figure(2);
plot(acc_exp41_user20);
figure(1);
hold on 
%plot(acc_exp41_user20);
for i = 1:length(row)
    a = plot((tempos(i,2): tempos(i,3)),acc_exp41_user20(tempos(i,2): tempos(i,3)),"DisplayName",int2str(tempos(i,1)));
end
legend
hold off



