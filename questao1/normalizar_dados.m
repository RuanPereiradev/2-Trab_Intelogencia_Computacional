function [X_norm, mu, sigma] = normalizar_dados(X)
% Normaliza os dados usando z-score (média 0, desvio padrão 1)
% Entrada:
%   X - matriz de features (N x M)
% Saída:
%   X_norm - matriz normalizada
%   mu - vetor de médias (1 x M)
%   sigma - vetor de desvios padrão (1 x M)

    mu = mean(X, 1);
    sigma = std(X, 0, 1);
    
    % Evitar divisão por zero
    sigma(sigma == 0) = 1;
    
    X_norm = (X - repmat(mu, size(X, 1), 1)) ./ repmat(sigma, size(X, 1), 1);
end