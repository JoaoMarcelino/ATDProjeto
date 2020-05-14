function [] = plotBonito(ficheiro,labels,nFigura,fs,eixo)
    entradas=load(labels);
    
    %plotar a sequencia toda
    hold on;
    figure(nFigura);
    dados=load(ficheiro);
    dados1=dados(1:end,eixo);
    Ts=1/fs;
    x=0:Ts:numel(dados1)*Ts-Ts;
    plot(x,dados1');
    
    
    nome=char(ficheiro);
    experiencia=nome(14:15);
    user=nome(21:22);
    experiencias=entradas(1:end,1);
    users=entradas(1:end,2);
    x=find(experiencias==str2double(experiencia));
    y=find(users==str2double(user));
    z=intersect(x,y); %entradas para um dado ficheiro
    
     for i=1:length(z)
            atividade=entradas(z(i),3);
            comeco=entradas(z(i),4);
            fim=entradas(z(i),5);
            abcissa=comeco*Ts:Ts:fim*Ts;
            seg=dados(comeco:fim,eixo)';
            plot(abcissa,seg);
            string=switchAtividade(atividade);
            meiox=round(length(abcissa)/2);
            meioy=round(length(seg)/2);
            text(abcissa(meiox),seg(meioy)*1.2,string,'HorizontalAlignment','center');
     end
    hold off;
    
    
end

