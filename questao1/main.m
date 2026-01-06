% ============================================================================
% Classificação do Vertebral Column Dataset usando Rede Neural RBF
% ============================================================================
% Autor: Projeto IC
% Descrição: Classifica dados vertebrais em 3 classes usando RBF com hold-out
% ============================================================================

clear all;
close all;
clc;

fprintf('========================================\n');
fprintf('Classificação Vertebral Column Dataset\n');
fprintf('Rede Neural RBF - Hold-out Validation\n');
fprintf('========================================\n\n');

% Carregar dados
fprintf('Carregando dados...\n');

% Verificar se o arquivo existe
if ~exist('column_3C.dat', 'file')
    error('Arquivo column_3C.dat não encontrado! Baixe do UCI: https://archive.ics.uci.edu/ml/datasets/Vertebral+Column');
end

% Ler arquivo com strings na última coluna
fid = fopen('column_3C.dat', 'r');
if fid == -1
    error('Não foi possível abrir o arquivo column_3C.dat');
end

% Ler todas as linhas
linhas = textscan(fid, '%f %f %f %f %f %f %s', 'Delimiter', ' ', 'MultipleDelimsAsOne', true);
fclose(fid);

% Converter para matriz
X = [linhas{1}, linhas{2}, linhas{3}, linhas{4}, linhas{5}, linhas{6}];
y_raw = linhas{7};  % Cell array com strings das classes

% Converter cell array de strings para cell array simples
y_raw = cellfun(@strtrim, y_raw, 'UniformOutput', false);

% Converter classes para numéricas
classes = unique(y_raw);
num_classes = length(classes);
fprintf('Classes encontradas: ');
for i = 1:num_classes
    fprintf('%s ', classes{i});
end
fprintf('\n');

% Mapear classes para valores numéricos: 1=Normal, 2=Disk Hernia, 3=Spondylolisthesis
y = zeros(size(y_raw));
for i = 1:length(classes)
    y(strcmp(y_raw, classes{i})) = i;
end

fprintf('Número de amostras: %d\n', length(y));
fprintf('Número de features: %d\n', size(X, 2));
fprintf('Número de classes: %d\n', num_classes);

% Normalizar dados (importante para RBF)
fprintf('\nNormalizando dados...\n');
[X_normalized, mu, sigma] = normalizar_dados(X);

% Parâmetros
num_execucoes = 10;
proporcao_treino = 0.7;
num_centros = 15;  % Número de centros RBF (ajustável)
sigma_rbf = 1.0;   % Parâmetro sigma da função gaussiana (ajustável)

fprintf('\nParâmetros da RBF:\n');
fprintf('  - Número de centros: %d\n', num_centros);
fprintf('  - Sigma RBF: %.2f\n', sigma_rbf);
fprintf('  - Execuções: %d\n', num_execucoes);
fprintf('  - Proporção treino: %.1f%%\n', proporcao_treino * 100);

% Armazenar acurácias de cada execução
acuracias = zeros(num_execucoes, 1);
matrizes_confusao = cell(num_execucoes, 1);

fprintf('\n========================================\n');
fprintf('Iniciando %d execuções...\n', num_execucoes);
fprintf('========================================\n\n');

for exec = 1:num_execucoes
    fprintf('Execução %d/%d:\n', exec, num_execucoes);
    
    % Permutar dados aleatoriamente
    rand("seed", exec);  % Seed diferente para cada execução (sintaxe Octave)
    idx = randperm(size(X_normalized, 1));
    X_perm = X_normalized(idx, :);
    y_perm = y(idx);
    
    % Dividir em treino (70%) e teste (30%)
    num_train = round(proporcao_treino * size(X_perm, 1));
    X_train = X_perm(1:num_train, :);
    y_train = y_perm(1:num_train);
    X_test = X_perm(num_train+1:end, :);
    y_test = y_perm(num_train+1:end);
    
    fprintf('  Treino: %d amostras, Teste: %d amostras\n', ...
            size(X_train, 1), size(X_test, 1));
    
    % Treinar rede RBF
    fprintf('  Treinando RBF...\n');
    [centros, pesos, bias] = treinar_rbf(X_train, y_train, num_classes, ...
                                         num_centros, sigma_rbf);
    
    % Testar rede RBF
    fprintf('  Testando RBF...\n');
    y_pred = predizer_rbf(X_test, centros, pesos, bias, sigma_rbf, num_classes);
    
    % Calcular acurácia
    acuracia = calcular_acuracia(y_test, y_pred);
    acuracias(exec) = acuracia;
    
    % Matriz de confusão
    matriz_confusao = calcular_matriz_confusao(y_test, y_pred, num_classes);
    matrizes_confusao{exec} = matriz_confusao;
    
    fprintf('  Acurácia: %.2f%%\n\n', acuracia * 100);
end

% Resultados finais
fprintf('========================================\n');
fprintf('RESULTADOS FINAIS\n');
fprintf('========================================\n');
fprintf('Acurácia por execução:\n');
for exec = 1:num_execucoes
    fprintf('  Execução %2d: %.2f%%\n', exec, acuracias(exec) * 100);
end

acuracia_media = mean(acuracias);
desvio_padrao = std(acuracias);

fprintf('\n');
fprintf('Acurácia Média: %.2f%% ± %.2f%%\n', acuracia_media * 100, desvio_padrao * 100);
fprintf('Melhor Acurácia: %.2f%%\n', max(acuracias) * 100);
fprintf('Pior Acurácia: %.2f%%\n', min(acuracias) * 100);

% Exibir matriz de confusão média
fprintf('\nMatriz de Confusão Média:\n');
matriz_confusao_media = zeros(num_classes, num_classes);
for exec = 1:num_execucoes
    matriz_confusao_media = matriz_confusao_media + matrizes_confusao{exec};
end
matriz_confusao_media = matriz_confusao_media / num_execucoes;

fprintf('\n');
fprintf('Classes: ');
for i = 1:num_classes
    fprintf('%12s', classes{i});
end
fprintf('\n');
for i = 1:num_classes
    fprintf('%12s', classes{i});
    for j = 1:num_classes
        fprintf('%12.1f', matriz_confusao_media(i, j));
    end
    fprintf('\n');
end

fprintf('\n========================================\n');
fprintf('Processo concluído!\n');
fprintf('========================================\n');