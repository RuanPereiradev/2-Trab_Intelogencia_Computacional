function filho = cruzar(pai1, pai2)
% Realiza cruzamento Order Crossover (OX) para TSP
% Garante que o filho seja uma permutação válida

    n = length(pai1);
    
    % Escolher dois pontos de corte aleatórios
    pontos = sort(randperm(n, 2));
    inicio = pontos(1);
    fim = pontos(2);
    
    % Inicializar filho com zeros
    filho = zeros(1, n);
    
    % Copiar segmento do pai1 para o filho
    filho(inicio:fim) = pai1(inicio:fim);
    
    % Preencher o restante com elementos do pai2 na ordem em que aparecem,
    % pulando os que já estão no segmento copiado
    posicao_filho = fim + 1;
    if posicao_filho > n
        posicao_filho = 1;
    end
    
    for i = 1:n
        elemento_pai2 = pai2(mod(fim + i - 1, n) + 1);
        
        % Se o elemento não está no segmento copiado
        if ~any(filho(inicio:fim) == elemento_pai2)
            filho(posicao_filho) = elemento_pai2;
            posicao_filho = posicao_filho + 1;
            if posicao_filho > n
                posicao_filho = 1;
            end
            if posicao_filho == inicio
                break;
            end
        end
    end
end