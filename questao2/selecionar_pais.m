function [pai1, pai2] = selecionar_pais(populacao, fitness)
% Seleciona dois pais usando seleção por torneio
% Torneio de tamanho 3

    tamanho_torneio = 3;
    tamanho_pop = size(populacao, 1);
    
    % Selecionar pai 1
    participantes1 = randperm(tamanho_pop, tamanho_torneio);
    [~, indice_vencedor1] = min(fitness(participantes1));
    pai1 = populacao(participantes1(indice_vencedor1), :);
    
    % Selecionar pai 2 (pode ser diferente)
    participantes2 = randperm(tamanho_pop, tamanho_torneio);
    [~, indice_vencedor2] = min(fitness(participantes2));
    pai2 = populacao(participantes2(indice_vencedor2), :);
end