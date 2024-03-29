function [outputArg1] = plotAllActivities(dados,fs)
    
    for i=1:12
        subplot(12,3,i*3-2);   %eixo X
        [frequencias,amplitude]=transFourierDiscreta(dados{1}{i}{1},fs);
        plot(frequencias,amplitude);
        
        subplot(12,3,i*3-1);   %eixo Y
        [frequencias,amplitude]=transFourierDiscreta(dados{2}{i}{1},fs);
        plot(frequencias,amplitude);
        
        subplot(12,3,i*3);   %eixo Z
        [frequencias,amplitude]=transFourierDiscreta(dados{3}{i}{1},fs);
        plot(frequencias,amplitude);
        
    end
end

