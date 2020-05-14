function [stringAtividade] = switchAtividade(numeroAtividade)
    numeroAtividade
    labels=["WALK","WALKUP","WALKDOWN","SIT","STAND","LAY","STANDSIT","SITSTAND","SITLIE","LIESIT","STANDLIE","LIESTAND"];
    stringAtividade=labels(numeroAtividade);
   
end