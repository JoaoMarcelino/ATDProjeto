function certo = teste45(amp1, amp2, amp3)

    [maximo1, ~] = max(amp1{1});

    [maximo2, ~] = max(amp2{1});
    
    [maximo3, ~] = max(amp3{1});
    
    if maximo1 > maximo2 && maximo2 > maximo3
        certo = 1;
    else
        certo = 0;
    end
end