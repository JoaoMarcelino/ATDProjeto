function exercicio44(files,labels,fs)
    
    entradas = load("./PL5/"+labels+".txt");
    counter = 1;
    
    for i = 1:length(files)
        fich = load("./PL5/"+files(i)+".txt");
        nome = char(files(i));
        experiencia = nome(8:9);
        user = nome(15:16);
        experiencias = entradas(1:end,1);
        users = entradas(1:end,2);
        x = find(experiencias==str2double(experiencia));
        y = find(users==str2double(user));
        z = intersect(x,y); %entradas para um dado ficheiro
        
        for j = 1:length(z)
            atividade = entradas(z(j),3);
            
            if atividade > 3
                comeco = entradas(z(j),4);
                fim = entradas(z(j),5);
                segmentoX = fich(comeco:fim,2);

                [freq,amp] = transFourierDiscreta(segmentoX,fs,1);
                figure(4);
                hold on;
                subplot(4, 3, counter);
                plot(freq, amp);
                counter = counter + 1;
                
                if atividade > 6
                    titulo = strcat(int2str(atividade), ' - transicao');
                else
                    titulo = strcat(int2str(atividade), ' - estatica');
                end
                
                title(titulo);
            end
        end
    end
    hold off
end