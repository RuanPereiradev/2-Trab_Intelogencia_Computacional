function custo = calcular_fitness(caminho, matriz_distancias)
% Calcula o custo total de um caminho (fitness)
% Em TSP, queremos MINIMIZAR o custo, então fitness = custo

    custo = 0;
    num_cidades = length(caminho);
    
    % Somar distâncias entre cidades consecutivas
    for i = 1:num_cidades-1
        cidade_atual = caminho(i);
        cidade_proxima = caminho(i + 1);
        custo = custo + matriz_distancias(cidade_atual, cidade_proxima);
    end
    
    % Adicionar distância da última cidade de volta à primeira
    custo = custo + matriz_distancias(caminho(num_cidades), caminho(1));
end