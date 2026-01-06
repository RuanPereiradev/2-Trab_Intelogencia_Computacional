% ============================================================================
% Algoritmo Genético para Problema do Caixeiro Viajante (TSP)
% ============================================================================
% Descrição: Resolve TSP com 14 cidades usando algoritmo genético
% ============================================================================

clear all;
close all;
clc;

fprintf('========================================\n');
fprintf('Algoritmo Genético - TSP (14 Cidades)\n');
fprintf('========================================\n\n');

% Carregar matriz de distâncias
fprintf('Carregando matriz de distâncias...\n');
matriz_distancias = carregar_matriz_distancias();

num_cidades = size(matriz_distancias, 1);
fprintf('Número de cidades: %d\n\n', num_cidades);

% Parâmetros do Algoritmo Genético
tamanho_populacao = 300;
num_geracoes = 2000;
taxa_cruzamento = 0.85;
taxa_mutacao = 0.15;
elitismo = true; % Manter o melhor indivíduo de cada geração

fprintf('Parâmetros do Algoritmo Genético:\n');
fprintf('  - Tamanho da população: %d\n', tamanho_populacao);
fprintf('  - Número de gerações: %d\n', num_geracoes);
fprintf('  - Taxa de cruzamento: %.1f%%\n', taxa_cruzamento * 100);
fprintf('  - Taxa de mutação: %.1f%%\n', taxa_mutacao * 100);
fprintf('  - Elitismo: %s\n\n', mat2str(elitismo));

% Inicializar população
fprintf('Inicializando população...\n');
populacao = inicializar_populacao(tamanho_populacao, num_cidades);

% Avaliar população inicial
fitness = zeros(tamanho_populacao, 1);
for i = 1:tamanho_populacao
    fitness(i) = calcular_fitness(populacao(i, :), matriz_distancias);
end

% Encontrar melhor indivíduo inicial
[melhor_fitness, indice_melhor] = min(fitness);
melhor_caminho = populacao(indice_melhor, :);
historico_melhor = zeros(num_geracoes, 1);
historico_media = zeros(num_geracoes, 1);

fprintf('População inicial criada.\n');
fprintf('Melhor custo inicial: %.2f\n\n', melhor_fitness);
fprintf('========================================\n');
fprintf('Executando Algoritmo Genético...\n');
fprintf('========================================\n\n');

% Loop principal do algoritmo genético
for geracao = 1:num_geracoes
    % Criar nova população
    nova_populacao = zeros(tamanho_populacao, num_cidades);
    nova_fitness = zeros(tamanho_populacao, 1);
    
    % Aplicar elitismo (manter o melhor)
    if elitismo
        nova_populacao(1, :) = melhor_caminho;
        nova_fitness(1) = melhor_fitness;
        inicio_novos = 2;
    else
        inicio_novos = 1;
    end
    
    % Gerar novos indivíduos
    for i = inicio_novos:tamanho_populacao
        % Seleção de pais
        [pai1, pai2] = selecionar_pais(populacao, fitness);
        
        % Cruzamento
        if rand() < taxa_cruzamento
            filho = cruzar(pai1, pai2);
        else
            % Se não cruzar, escolher um dos pais aleatoriamente
            if rand() < 0.5
                filho = pai1;
            else
                filho = pai2;
            end
        end
        
        % Mutação
        if rand() < taxa_mutacao
            filho = mutar(filho);
        end
        
        nova_populacao(i, :) = filho;
        nova_fitness(i) = calcular_fitness(filho, matriz_distancias);
    end
    
    % Atualizar população
    populacao = nova_populacao;
    fitness = nova_fitness;
    
    % Atualizar melhor indivíduo
    [min_fitness, indice_melhor] = min(fitness);
    if min_fitness < melhor_fitness
        melhor_fitness = min_fitness;
        melhor_caminho = populacao(indice_melhor, :);
    end
    
    % Registrar histórico
    historico_melhor(geracao) = melhor_fitness;
    historico_media(geracao) = mean(fitness);
    
    % Mostrar progresso a cada 50 gerações
    if mod(geracao, 50) == 0 || geracao == 1
        fprintf('Geração %3d/%d: Melhor = %.2f, Média = %.2f\n', ...
                geracao, num_geracoes, melhor_fitness, historico_media(geracao));
    end
end

fprintf('\n========================================\n');
fprintf('RESULTADOS FINAIS\n');
fprintf('========================================\n\n');

% Exibir melhor caminho encontrado
fprintf('Melhor caminho encontrado:\n');
fprintf('  ');
for i = 1:length(melhor_caminho)
    fprintf('%02d', melhor_caminho(i));
    if i < length(melhor_caminho)
        fprintf(' -> ');
    end
end
fprintf(' -> %02d\n\n', melhor_caminho(1));  % Voltar à cidade inicial

% Calcular custo detalhado
custo_total = calcular_fitness(melhor_caminho, matriz_distancias);
fprintf('Custo total do percurso: %.2f\n\n', custo_total);

% Mostrar distâncias entre cidades consecutivas
fprintf('Distâncias por trecho:\n');
custo_total_verificacao = 0;
for i = 1:length(melhor_caminho)
    cidade_atual = melhor_caminho(i);
    if i < length(melhor_caminho)
        cidade_proxima = melhor_caminho(i + 1);
    else
        cidade_proxima = melhor_caminho(1);  % Voltar à primeira
    end
    distancia = matriz_distancias(cidade_atual, cidade_proxima);
    custo_total_verificacao = custo_total_verificacao + distancia;
    fprintf('  Cidade %02d -> Cidade %02d: %.2f\n', cidade_atual, cidade_proxima, distancia);
end
fprintf('  Total: %.2f\n\n', custo_total_verificacao);

% Plotar evolução do algoritmo
figure;
plot(1:num_geracoes, historico_melhor, 'b-', 'LineWidth', 2);
hold on;
plot(1:num_geracoes, historico_media, 'r--', 'LineWidth', 1.5);
xlabel('Geração');
ylabel('Custo');
title('Evolução do Algoritmo Genético');
legend('Melhor Custo', 'Custo Médio', 'Location', 'northeast');
grid on;

fprintf('========================================\n');
fprintf('Processo concluído!\n');
fprintf('========================================\n');