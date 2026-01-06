function y_pred = predizer_rbf(X_test, centros, pesos, bias, sigma_rbf, num_classes)
% Prediz classes usando rede RBF treinada
% Entrada:
%   X_test - dados de teste (N x M)
%   centros - matriz de centros RBF
%   pesos - matriz de pesos
%   bias - vetor de bias
%   sigma_rbf - parâmetro sigma
%   num_classes - número de classes
% Saída:
%   y_pred - classes preditas (N x 1)

    [N, ~] = size(X_test);
    num_centros = size(centros, 1);
    
    % Calcular saídas da camada oculta RBF
    H = zeros(N, num_centros);
    for i = 1:N
        for j = 1:num_centros
            distancia = norm(X_test(i, :) - centros(j, :));
            H(i, j) = exp(-(distancia^2) / (2 * sigma_rbf^2));
        end
    end
    
    % Calcular saídas da camada de saída
    Y = H * pesos + repmat(bias', N, 1);
    
    % A classe predita é a que tem maior valor de saída
    [~, y_pred] = max(Y, [], 2);
end