function [eixosFinal] = organizar(files,labels)
    entradas=load("./PL5/"+labels+".txt");
    eixosFinal={};
    
    
    for i=1:length(files)
        fich=load("./PL5/"+files(i)+".txt");
        nome=char(files(i));
        experiencia=nome(8:9);
        user=nome(15:16);
        experiencias=entradas(1:end,1);
        users=entradas(1:end,2);
        x=find(experiencias==str2double(experiencia));
        y=find(users==str2double(user));
        z=intersect(x,y); %entradas para um dado ficheiro
        
        for i=1:length(z)
            atividade=entradas(z(i),3);
            comeco=entradas(z(i),4);
            fim=entradas(z(i),5);
            segmento1=fich(comeco:fim,1);
            segmento2=fich(comeco:fim,2);
            segmento3=fich(comeco:fim,3);
            if(isempty(eixosFinal))
                eixosFinal{1}{atividade}{1}=segmento1;
                eixosFinal{2}{atividade}{1}=segmento2;
                eixosFinal{3}{atividade}{1}=segmento3;
            elseif(length(eixosFinal{1})<atividade)
                eixosFinal{1}{atividade}{1}=segmento1;
                eixosFinal{2}{atividade}{1}=segmento2;
                eixosFinal{3}{atividade}{1}=segmento3;
            elseif(isempty(eixosFinal{1}{atividade}))
                eixosFinal{1}{atividade}{1}=segmento1;
                eixosFinal{2}{atividade}{1}=segmento2;
                eixosFinal{3}{atividade}{1}=segmento3;
            else
                eixosFinal{1}{atividade}{length(eixosFinal{1}{atividade})+1}=segmento1;
                eixosFinal{2}{atividade}{length(eixosFinal{2}{atividade})+1}=segmento2;
                eixosFinal{3}{atividade}{length(eixosFinal{3}{atividade})+1}=segmento3;
            end
        end    
    end
    
    
