# Algoritmo Genético para Problema do Caixeiro Viajante (TSP)

## 📋 Descrição

Implementação de um algoritmo genético para resolver o **Problema do Caixeiro Viajante (TSP - Traveling Salesman Problem)** em um grafo completo não direcionado com **14 vértices (cidades)**. O algoritmo encontra o caminho de menor custo que visita todas as cidades exatamente uma vez e retorna à cidade de origem.

## 🎯 Objetivo

Encontrar o melhor caminho (rota de menor custo) que percorre todas as 14 cidades do grafo, minimizando a distância total do percurso.

## 🔧 Tecnologias

- **GNU Octave** (versão 4.0 ou superior)

## 📁 Estrutura do Projeto
├── main_tsp.m # Script principal
├── carregar_matriz_distancias.m # Carrega matriz de distâncias
├── inicializar_populacao.m # Inicializa população aleatória
├── calcular_fitness.m # Calcula custo do caminho
├── selecionar_pais.m # Seleção por torneio
├── cruzar.m # Cruzamento Order Crossover (OX)
├── mutar.m # Mutação por swap
└── README.md # Este arquivo


## 🚀 Como Executar

### Pré-requisitos

1. Instalar GNU Octave:h
sudo apt-get install octave  # Linux
# ou baixar de https://www.gnu.org/software/octave/
2. Navegar até a pasta do projeto:h
cd questao23. Executar o script principal:
octave main_tsp.m## ⚙️ Parâmetros do Algoritmo

Os parâmetros podem ser ajustados no arquivo `main_tsp.m`:

tamanho_populacao = 300;    % Número de indivíduos na população
num_geracoes = 2000;        % Número de gerações
taxa_cruzamento = 0.85;     % Probabilidade de cruzamento (85%)
taxa_mutacao = 0.15;        % Probabilidade de mutação (15%)
elitismo = true;            % Preserva o melhor indivíduo## 📊 Resultados Obtidos

### Configuração Utilizada
- **Tamanho da população:** 300 indivíduos
- **Número de gerações:** 2000
- **Taxa de cruzamento:** 85%
- **Taxa de mutação:** 15%
- **Elitismo:** Ativado

### Melhor Solução Encontrada

**Caminho encontrado:** 

cd questao2tal do percurso:** **46.00 unidades**

### Análise de Convergência

- **Custo inicial (melhor da população):** 64.00
- **Custo final:** 46.00
- **Melhoria:** 28.1% de redução no custo
- **Convergência:** O algoritmo convergiu para o custo 46.00 aproximadamente na geração 50
- **Estabilidade:** Manteve-se estável em 46.00 até a geração 2000

### Detalhamento do Percurso

| Trecho | Distância |
|--------|-----------|
| Cidade 07 → Cidade 08 | 2.00 |
| Cidade 08 → Cidade 09 | 3.00 |
| Cidade 09 → Cidade 10 | 2.00 |
| Cidade 10 → Cidade 11 | 3.00 |
| Cidade 11 → Cidade 13 | 3.00 |
| Cidade 13 → Cidade 14 | 2.00 |
| Cidade 14 → Cidade 12 | 4.00 |
| Cidade 12 → Cidade 06 | 8.00 |
| Cidade 06 → Cidade 05 | 4.00 |
| Cidade 05 → Cidade 04 | 3.00 |
| Cidade 04 → Cidade 03 | 2.00 |
| Cidade 03 → Cidade 01 | 2.00 |
| Cidade 01 → Cidade 02 | 1.00 |
| Cidade 02 → Cidade 07 | 7.00 |
| **TOTAL** | **46.00** |

## 🔬 Metodologia

### 1. Representação do Cromossomo
Cada indivíduo é representado como uma permutação das 14 cidades (1 a 14), garantindo que cada cidade seja visitada exatamente uma vez.

### 2. Função de Fitness
A função de fitness calcula o custo total do caminho, somando as distâncias entre cidades consecutivas, incluindo o retorno à cidade inicial. O objetivo é **minimizar** este custo.

### 3. Operadores Genéticos

#### Seleção
- **Tipo:** Seleção por Torneio
- **Tamanho do torneio:** 3 indivíduos
- Seleciona o indivíduo com menor custo (melhor fitness) no torneio

#### Cruzamento
- **Tipo:** Order Crossover (OX)
- **Taxa:** 85%
- Preserva a ordem relativa dos elementos, garantindo permutações válidas

#### Mutação
- **Tipo:** Swap (troca de duas posições)
- **Taxa:** 15%
- Seleciona duas cidades aleatórias e as troca de posição

#### Elitismo
- Preserva o melhor indivíduo de cada geração para a próxima
- Garante que a melhor solução nunca seja perdida

### 4. Inicialização
A população inicial é gerada com permutações aleatórias das cidades, garantindo diversidade inicial.

## 📈 Gráficos

O algoritmo gera automaticamente um gráfico mostrando:
- Evolução do melhor custo ao longo das gerações (linha azul)
- Evolução do custo médio da população (linha vermelha tracejada)

## 🔍 Como Ajustar a Matriz de Distâncias

Para usar uma matriz de distâncias diferente, edite o arquivo `carregar_matriz_distancias.m` e substitua os valores da matriz. A matriz deve ser simétrica (grafo não direcionado) e ter dimensão 14x14.

## ⚠️ Observações

- O algoritmo encontra uma solução **ótima local**. Para garantir solução ótima global, seria necessário comparar com métodos exatos (força bruta), mas isso é computacionalmente inviável para 14 cidades (13!/2 ≈ 3.1 bilhões de possibilidades).
- O tempo de execução depende da configuração: com 300 indivíduos e 2000 gerações, pode levar alguns minutos.
- Resultados podem variar ligeiramente entre execuções devido à aleatoriedade, mas o algoritmo tende a convergir para valores similares.

## 📝 Referências

- Problema do Caixeiro Viajante (TSP)
- Algoritmos Genéticos
- Order Crossover (OX) para TSP

## 👤 Autor

Projeto desenvolvido para a disciplina de Inteligência Computacional.

## 📄 Licença

Este projeto é apenas para fins educacionais.

Executar o script principal:
octave main_tsp.m

# ⚙️ Parâmetros do Algoritmo
Os parâmetros podem ser ajustados no arquivo main_tsp.m:
tamanho_populacao = 300;    % Número de indivíduos na população
num_geracoes = 2000;        % Número de gerações
taxa_cruzamento = 0.85;     % Probabilidade de cruzamento (85%)
taxa_mutacao = 0.15;        % Probabilidade de mutação (15%)
elitismo = true;            % Preserva o melhor indivíduo

## 📊 Resultados Obtidos
Configuração Utilizada
Tamanho da população: 300 indivíduos
Número de gerações: 2000
Taxa de cruzamento: 85%
Taxa de mutação: 15%
Elitismo: Ativado
Melhor Solução Encontrada
Caminho encontrado:
07 → 08 → 09 → 10 → 11 → 13 → 14 → 12 → 06 → 05 → 04 → 03 → 01 → 02 → 07
Custo total do percurso: 46.00 unidades
nálise de Convergência
Custo inicial (melhor da população): 64.00
Custo final: 46.00
Melhoria: 28.1% de redução no custo
Convergência: O algoritmo convergiu para o custo 46.00 aproximadamente na geração 50
Estabilidade: Manteve-se estável em 46.00 até a geração 2000
Detalhamento do Percurso
Trecho	Distância
Cidade 07 → Cidade 08	2.00
Cidade 08 → Cidade 09	3.00
Cidade 09 → Cidade 10	2.00
Cidade 10 → Cidade 11	3.00
Cidade 11 → Cidade 13	3.00
Cidade 13 → Cidade 14	2.00
Cidade 14 → Cidade 12	4.00
Cidade 12 → Cidade 06	8.00
Cidade 06 → Cidade 05	4.00
Cidade 05 → Cidade 04	3.00
Cidade 04 → Cidade 03	2.00
Cidade 03 → Cidade 01	2.00
Cidade 01 → Cidade 02	1.00
Cidade 02 → Cidade 07	7.00
TOTAL	46.00
## 🔬 Metodologia
1. Representação do Cromossomo
Cada indivíduo é representado como uma permutação das 14 cidades (1 a 14), garantindo que cada cidade seja visitada exatamente uma vez.
2. Função de Fitness
A função de fitness calcula o custo total do caminho, somando as distâncias entre cidades consecutivas, incluindo o retorno à cidade inicial. O objetivo é minimizar este custo.
3. Operadores Genéticos
Seleção
Tipo: Seleção por Torneio
Tamanho do torneio: 3 indivíduos
Seleciona o indivíduo com menor custo (melhor fitness) no torneio
Cruzamento
Tipo: Order Crossover (OX)
Taxa: 85%
Preserva a ordem relativa dos elementos, garantindo permutações válidas
Mutação
Tipo: Swap (troca de duas posições)
Taxa: 15%
Seleciona duas cidades aleatórias e as troca de posição
Elitismo
Preserva o melhor indivíduo de cada geração para a próxima
Garante que a melhor solução nunca seja perdida
4. Inicialização
A população inicial é gerada com permutações aleatórias das cidades, garantindo diversidade inicial.
## 📈 Gráficos
O algoritmo gera automaticamente um gráfico mostrando:
Evolução do melhor custo ao longo das gerações (linha azul)
Evolução do custo médio da população (linha vermelha tracejada)
## 🔍 Como Ajustar a Matriz de Distâncias
Para usar uma matriz de distâncias diferente, edite o arquivo carregar_matriz_distancias.m e substitua os valores da matriz. A matriz deve ser simétrica (grafo não direcionado) e ter dimensão 14x14.
⚠️ Observações
O algoritmo encontra uma solução ótima local. Para garantir solução ótima global, seria necessário comparar com métodos exatos (força bruta), mas isso é computacionalmente inviável para 14 cidades (13!/2 ≈ 3.1 bilhões de possibilidades).
O tempo de execução depende da configuração: com 300 indivíduos e 2000 gerações, pode levar alguns minutos.
Resultados podem variar ligeiramente entre execuções devido à aleatoriedade, mas o algoritmo tende a convergir para valores similares.
## 📝 Referências
Problema do Caixeiro Viajante (TSP)
Algoritmos Genéticos
Order Crossover (OX) para TSP
