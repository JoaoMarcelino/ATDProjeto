function exercicio45()

    exp_num = 41;
    user_num = 20;
    labels = load('./PL5/labels.txt'); 
    counter = 1;
    maxi = zeros([30,3]);
    temp = cell([3,2]);
%     certas = 0;

    for linha = 1:10
        
        ficheiro = strcat('./PL5/acc_exp', int2str(exp_num), '_user', int2str(user_num), '.txt');       
        input = load(ficheiro);          
            
        for j = 1:3
            
            for i = 1:3 %mudar isto para o eixo para contar as certas em comentario

                input_eixo = input(:,i);

                indices_exp = find(labels(:,1) == exp_num);

                indices_aux = find(labels(indices_exp,3) == j);
                walking = indices_exp(indices_aux);

                sinal = input_eixo(labels(walking(1),4):labels(walking(1),5), 1);

                [temp{j,1}, temp{j,2}] = transFourierDiscreta(sinal, 50, 1);

                [maximo, ~] = max(temp{j,2});

                maxi(counter,i) = maximo;
                
                
            end
            counter = counter + 1;
        end
        
%         certas = certas + teste45(temp(1,2), temp(2,2), temp(3,2));
        exp_num = exp_num + 1;
        if rem(exp_num, 2) == 0
            user_num = user_num + 1;
        end
            
    end
    
    figure(5);
    scatter3(maxi(1:3:end,1), maxi(1:3:end,2), maxi(1:3:end,3), 'MarkerEdgeColor', [1,0,0]);
    hold on;
    scatter3(maxi(2:3:end,1), maxi(2:3:end,2), maxi(2:3:end,3), 'MarkerEdgeColor', [0,1,0]);
    scatter3(maxi(3:3:end,1), maxi(3:3:end,2), maxi(3:3:end,3), 'MarkerEdgeColor', [0,0,1]);
    hold off;
%     disp(certas);
end