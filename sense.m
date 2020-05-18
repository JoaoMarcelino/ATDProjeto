function [especificidade,sensibilidade] = sense(files,labels,fs,min,max,figura)
    entradas=load("./PL5/"+labels+".txt");
    
    pv=0;
    pf=0;
    fv=0;
    ff=0;
    counter=1;
    array=[0,0,0,0,0];
    figure(figura);
    
    
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
            
            [freq,amp]=transFourierDiscreta(segmentoX,fs,1);
            
            
            
            passos=melhorPixa(freq,amp);
            if(length(passos)~=1)
                passos=abs(passos(1));
            end
            
            if(passos>min && passos<max && atividade<=3)
                pv=pv+1;
                array=[array;   counter,passos,0,255,0];
                
            elseif(passos>min && passos<max && atividade>3)
                pf=pf+1;
                array=[array;  counter,passos,255,0,0];
                
            elseif((passos<min || passos>max) && atividade>3)
                fv=fv+1;
                array=[array;  counter,passos,0,255,0];
                
            elseif((passos<min || passos>max) && atividade<=3)
                ff=ff+1;
                array=[array;  counter,passos,255,0,0];
                
            end
            
            counter=counter+1;
        end
        
        
        sensibilidade=pv/(pv+ff);
        especificidade=fv/(fv+pf);
        
        hold on;
        for i=2:length(array)
            scatter(double(array(i,1)),double(array(i,2)),'markeredgecolor',array(i,3:5)./255);
            
        end
        hold off;
        xlabel("Nº segmento");
        ylabel("Passos por minuto");
end

