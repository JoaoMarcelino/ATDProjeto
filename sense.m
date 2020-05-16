function [especificidade,sensibilidade] = sense(files,labels,fs,min,max,figura)
    entradas=load("./PL5/"+labels+".txt");
    
    pv=0;
    pf=0;
    fv=0;
    ff=0;
    counter=1;
    array=[0;0;0];
    figure(figura);
    hold on;
    
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
            segmentoX=fich(comeco:fim,1);
            
            [freq,amp]=transFourierDiscreta(segmentoX,fs);
            passos=melhorPixa(freq,amp);
            if(length(passos)~=1)
                passos=abs(passos(1));
            end
            if(passos>min && passos<max && atividade<=3)
                pv=pv+1;
                array=[array, [counter;passos;"pv"]];
            elseif(passos>min && passos<max && atividade>3)
                pf=pf+1;
                array=[array, [counter;passos;"pf"]];    
            elseif((passos<min || passos>max) && atividade>3)
                fv=fv+1;
                array=[array, [counter;passos;"fv"]];
            elseif((passos<min || passos>max) && atividade<3)
                ff=ff+1;
                array=[array, [counter;passos;"ff"]];
            end
            
            counter=counter+1;
        end
        
        plot(double(array(1,2:end)),double(array(2,2:end)),"o");
        text(double(array(1,2:end)),double(array(2,2:end)),array(3,2:end));
        sensibilidade=pv/(pv+ff);
        especificidade=fv/(fv+pf);
        
        hold off;
end

