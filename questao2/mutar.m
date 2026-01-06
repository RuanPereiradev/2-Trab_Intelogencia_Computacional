function individuo = mutar(individuo)
% Realiza mutação trocando duas cidades aleatórias (swap)

    n = length(individuo);
    
    % Escolher duas posições aleatórias diferentes
    posicoes = randperm(n, 2);
    pos1 = posicoes(1);
    pos2 = posicoes(2);
    
    % Trocar as cidades
    temp = individuo(pos1);
    individuo(pos1) = individuo(pos2);
    individuo(pos2) = temp;
end