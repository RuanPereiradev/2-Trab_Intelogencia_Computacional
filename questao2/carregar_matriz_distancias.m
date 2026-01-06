function matriz = carregar_matriz_distancias()
% Carrega a matriz de distâncias entre as 14 cidades
% A matriz deve ser simétrica (grafo não direcionado)

    % Matriz de distâncias 14x14
    % Baseada na imagem fornecida (valores exemplo - ajuste conforme necessário)
    % Estrutura: linha i, coluna j = distância da cidade i para cidade j
    
    % Inicializar matriz completa com zeros
    matriz = zeros(14, 14);
    
    % Dados da matriz triangular superior (ajuste os valores conforme a imagem)
    % Exemplo de valores baseado em padrão típico - SUBSTITUA pelos valores reais
    dados_triangular = [
        0,  1,  2,  4,  3,  5,  6,  7,  8,  9, 10, 11, 12, 13;
        0,  0,  3,  5,  4,  6,  7,  8,  9, 10, 11, 12, 13, 14;
        0,  0,  0,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12;
        0,  0,  0,  0,  3,  5,  6,  7,  8,  9, 10, 11, 12, 13;
        0,  0,  0,  0,  0,  4,  5,  6,  7,  8,  9, 10, 11, 12;
        0,  0,  0,  0,  0,  0,  3,  4,  5,  6,  7,  8,  9, 10;
        0,  0,  0,  0,  0,  0,  0,  2,  3,  4,  5,  6,  7,  8;
        0,  0,  0,  0,  0,  0,  0,  0,  3,  4,  5,  6,  7,  8;
        0,  0,  0,  0,  0,  0,  0,  0,  0,  2,  3,  4,  5,  6;
        0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  3,  4,  5,  6;
        0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  2,  3,  4;
        0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  3,  4;
        0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  2;
        0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0;
    ];
    
    % Construir matriz simétrica
    for i = 1:14
        for j = 1:14
            if i == j
                matriz(i, j) = 0;  % Distância de uma cidade para ela mesma
            elseif i < j
                matriz(i, j) = dados_triangular(i, j);
            else
                matriz(i, j) = dados_triangular(j, i);  % Simetria
            end
        end
    end
    
    % ALTERNATIVA: Se você tiver um arquivo com a matriz, use:
    % matriz = load('matriz_distancias.dat');
    
    % ALTERNATIVA: Se quiser criar manualmente a partir da imagem:
    % Preencha a matriz abaixo com os valores exatos da imagem
    % matriz = [
    %     0,  1,  2,  4, ...;
    %     1,  0,  3,  5, ...;
    %     ...
    % ];
end