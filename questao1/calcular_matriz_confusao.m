function matriz = calcular_matriz_confusao(y_true, y_pred, num_classes)
% Calcula a matriz de confusão
% Entrada:
%   y_true - classes verdadeiras (N x 1)
%   y_pred - classes preditas (N x 1)
%   num_classes - número de classes
% Saída:
%   matriz - matriz de confusão (num_classes x num_classes)

    matriz = zeros(num_classes, num_classes);
    
    for i = 1:length(y_true)
        matriz(y_true(i), y_pred(i)) = matriz(y_true(i), y_pred(i)) + 1;
    end
end