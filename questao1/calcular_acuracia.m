function acuracia = calcular_acuracia(y_true, y_pred)
% Calcula a acurácia de classificação
% Entrada:
%   y_true - classes verdadeiras (N x 1)
%   y_pred - classes preditas (N x 1)
% Saída:
%   acuracia - acurácia (0 a 1)

    acuracia = sum(y_true == y_pred) / length(y_true);
end