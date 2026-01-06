function [centros, pesos, bias] = treinar_rbf(X_train, y_train, num_classes, ...
                                              num_centros, sigma_rbf)
% Treina uma rede neural RBF
% Entrada:
%   X_train - dados de treino (N x M)
%   y_train - classes de treino (N x 1)
%   num_classes - número de classes
%   num_centros - número de centros RBF
%   sigma_rbf - parâmetro sigma da função gaussiana
% Saída:
%   centros - matriz de centros RBF (num_centros x M)
%   pesos - matriz de pesos da camada de saída (num_centros x num_classes)
%   bias - vetor de bias (num_classes x 1)

    [N, M] = size(X_train);
    
    % Passo 1: Inicializar centros usando k-means
    fprintf('    Inicializando centros com k-means...\n');
    
    % Implementação de k-means simples para Octave
    % Inicializar centros aleatoriamente
    centros = X_train(randperm(N, num_centros), :);
    
    % K-means iterativo
    max_iter = 100;
    for iter = 1:max_iter
        % Calcular distâncias e atribuir clusters
        distancias = zeros(N, num_centros);
        for i = 1:N
            for j = 1:num_centros
                distancias(i, j) = norm(X_train(i, :) - centros(j, :));
            end
        end
        [~, idx] = min(distancias, [], 2);
        
        % Atualizar centros
        centros_antigos = centros;
        for j = 1:num_centros
            pontos_cluster = X_train(idx == j, :);
            if size(pontos_cluster, 1) > 0
                centros(j, :) = mean(pontos_cluster, 1);
            end
        end
        
        % Verificar convergência
        if norm(centros - centros_antigos, 'fro') < 1e-6
            break;
        end
    end
    
    % Passo 2: Calcular saídas da camada oculta RBF
    fprintf('    Calculando saídas da camada RBF...\n');
    H = zeros(N, num_centros);
    for i = 1:N
        for j = 1:num_centros
            distancia = norm(X_train(i, :) - centros(j, :));
            H(i, j) = exp(-(distancia^2) / (2 * sigma_rbf^2));
        end
    end
    
    % Adicionar coluna de bias (1s) à matriz H
    H_bias = [H, ones(N, 1)];
    
    % Passo 3: Criar matriz de saídas desejadas (one-hot encoding)
    T = zeros(N, num_classes);
    for i = 1:N
        T(i, y_train(i)) = 1;
    end
    
    % Passo 4: Calcular pesos da camada de saída usando pseudoinversa
    % W = H^+ * T, onde H^+ é a pseudoinversa de Moore-Penrose
    fprintf('    Calculando pesos da camada de saída...\n');
    H_pinv = pinv(H_bias);
    W_bias = H_pinv * T;
    
    % Separar pesos e bias
    pesos = W_bias(1:num_centros, :);
    bias = W_bias(num_centros + 1, :)';
end