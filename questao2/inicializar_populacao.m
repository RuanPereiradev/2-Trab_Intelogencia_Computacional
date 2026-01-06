function populacao = inicializar_populacao(tamanho, num_cidades)
% Inicializa uma população de indivíduos (caminhos) aleatórios
% Cada indivíduo é uma permutação das cidades (1 a num_cidades)

    populacao = zeros(tamanho, num_cidades);
    
    for i = 1:tamanho
        populacao(i, :) = randperm(num_cidades);
    end
end