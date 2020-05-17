function [andar1,up1,down1] = sense2(files,labels,fs)
    entradas=load("./PL5/"+labels+".txt");
    
    andar=[];
    up=[];
    down=[];
    
    counter=1;
    array=[0,0,0,0,0];
    
    
    
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
            segmentoX=fich(comeco:fim,2);

            if(atividade>3)
                continue;
            end

            [freq,amp]=transFourierDiscreta(segmentoX,fs,0);

            [maximo,indice]=max(amp);
            
            
            if(atividade==1)
                andar=[andar,maximo];
            elseif(atividade==2)
                up=[up,maximo];
            elseif(atividade==3)
                down=[down,maximo];
            end
            
            counter=counter+1;
        end
        
        
        andar1=[mean(andar),std(andar)];
        up1=[mean(up),std(up)];
        down1=[mean(down),std(down)];
end
