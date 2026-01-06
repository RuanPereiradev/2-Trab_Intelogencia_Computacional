# Trabalho de Inteligência Computacional

## 📚 Disciplina
Inteligência Computacional

## 📅 Informações de Entrega
- **Data de entrega:** 06/01/2026
- **Envio:** Via e-mail para **jarbas_joaci@yahoo.com.br**
- **Formato:** Enviar os arquivos do projeto
- **Observações:**
  - O trabalho pode ser realizado em dupla
  - Não serão aceitos trabalhos após o prazo

---

## 📋 Descrição do Trabalho

Este trabalho consiste na implementação de duas questões de Inteligência Computacional utilizando GNU Octave:

### Questão 1: Classificação com Rede Neural RBF
Classificação do conjunto de dados **Vertebral Column Dataset** em três classes (normal, disk hernia e spondilolisthesis) usando uma rede neural RBF (Radial Basis Function).

**Requisitos:**
- Estratégia de validação hold-out (70% treino / 30% teste)
- 10 execuções com permutação aleatória dos dados
- Resultado: acurácia média

**Dataset:** [Vertebral Column Dataset - UCI](https://archive.ics.uci.edu/ml/datasets/Vertebral+Column)

### Questão 2: Problema do Caixeiro Viajante (TSP)
Implementação de um algoritmo genético para resolver o Problema do Caixeiro Viajante em um grafo completo não direcionado com 14 vértices (cidades).

**Requisitos:**
- Matriz de adjacência representa as distâncias entre as cidades
- O algoritmo deve exibir o melhor caminho encontrado e o seu custo de percurso

---

## 🗂️ Estrutura do Projeto
trabalho2/
├── README.md # Este arquivo
├── questao1/ # Questão 1: Rede Neural RBF
│ ├── main.m # Script principal
│ ├── normalizar_dados.m # Normalização dos dados
│ ├── treinar_rbf.m # Treinamento da rede RBF
│ ├── predizer_rbf.m # Predição usando RBF
│ ├── calcular_acuracia.m # Cálculo de acurácia
│ ├── calcular_matriz_confusao.m # Matriz de confusão
│ ├── column_3C.dat # Dataset (baixar do UCI)
│ └── README.md # Documentação específica
├── questao2/ # Questão 2: Algoritmo Genético TSP
│ ├── main_tsp.m # Script principal
│ ├── carregar_matriz_distancias.m # Carregamento da matriz
│ ├── inicializar_populacao.m # Inicialização da população
│ ├── calcular_fitness.m # Cálculo de fitness
│ ├── selecionar_pais.m # Seleção de pais
│ ├── cruzar.m # Operador de cruzamento
│ ├── mutar.m # Operador de mutação
│ └── README.md # Documentação específica
└── treinar_rbf.m # (arquivo auxiliar)


---

## 🚀 Como Executar

### Pré-requisitos
- **GNU Octave** instalado (versão 4.0 ou superior)

### Instalação do Octave

**Linux:**
sudo apt-get update
sudo apt-get install octave**Windows/Mac:**  
Baixar do site oficial: https://www.gnu.org/software/octave/

### Executar Questão 1

1. Navegue até a pasta da questão 1:
cd questao12. Baixe o dataset `column_3C.dat` do site UCI e coloque na pasta `questao1/`

3. Execute o script principal:
octave main.m### Executar Questão 2

1. Navegue até a pasta da questão 2:sh
cd questao22. Execute o script principal:
octave main_tsp.m---

## 📊 Resultados Obtidos

### Questão 1: Rede Neural RBF

**Configuração:**
- Dataset: Vertebral Column (310 amostras, 6 features, 3 classes)
- Validação: Hold-out (70% treino / 30% teste)
- Execuções: 10 com permutações aleatórias
- Classes: DH (Disk Hernia), NO (Normal), SL (Spondylolisthesis)

**Resultado:**
- **Acurácia média:** 77.31% ± 3.88%
- **Melhor acurácia:** 82.80%
- **Pior acurácia:** 72.04%

### Questão 2: Algoritmo Genético - TSP

**Configuração:**
- Número de cidades: 14
- Tamanho da população: 300
- Número de gerações: 2000
- Taxa de cruzamento: 85%
- Taxa de mutação: 15%
- Elitismo: Ativado

**Resultado:**
- **Melhor caminho encontrado:**

Windows/Mac:
Baixar do site oficial: https://www.gnu.org/software/octave/



Executar Questão 1
Navegue até a pasta da questão 1
cd questao1otal do percurso:** 46.00 unidades
- **Melhoria:** Redução de 28.1% em relação ao custo inicial (64.00)

---

## 🔧 Tecnologias Utilizadas

- **GNU Octave** - Ambiente de desenvolvimento e execução
- **Machine Learning** - Redes Neurais RBF
- **Metaheurísticas** - Algoritmos Genéticos

---

## 📝 Detalhamento das Implementações

### Questão 1: Rede Neural RBF

A implementação inclui:
- Normalização dos dados (z-score)
- Inicialização de centros via K-means
- Função de base radial gaussiana
- Cálculo de pesos via pseudoinversa de Moore-Penrose
- Validação hold-out com múltiplas execuções
- Análise de resultados com matriz de confusão

### Questão 2: Algoritmo Genético - TSP

A implementação inclui:
- Representação cromossômica (permutação das cidades)
- Função de fitness (custo total do caminho)
- Seleção por torneio
- Cruzamento Order Crossover (OX)
- Mutação por swap
- Elitismo para preservar melhores soluções
- Visualização da evolução do algoritmo

---

## 📚 Referências

- **Vertebral Column Dataset:** https://archive.ics.uci.edu/ml/datasets/Vertebral+Column
- **GNU Octave:** https://www.gnu.org/software/octave/
- Problema do Caixeiro Viajante (TSP)
- Redes Neurais de Função de Base Radial (RBF)
- Algoritmos Genéticos

---

## 👥 Autores

### Ruan Pereira

## 📧 Contato

Para dúvidas sobre a implementação, entre em contato com os autores.

---

## ⚠️ Observações Importantes

1. Certifique-se de ter o dataset `column_3C.dat` na pasta `questao1/` antes de executar a questão 1
2. A matriz de distâncias na questão 2 pode ser ajustada no arquivo `carregar_matriz_distancias.m`
3. Os parâmetros dos algoritmos podem ser modificados nos scripts principais para experimentação
4. Resultados podem variar ligeiramente entre execuções devido à aleatoriedade, mas tendem a convergir para valores similares

---

## 📄 Licença

Este trabalho é apenas para fins educacionais e acadêmicos.


Baixe o dataset column_3C.dat do site UCI e coloque na pasta questao1/
Execute o script principal:
octave main.m
Executar Questão 2
Navegue até a pasta da questão 2:
cd questao2
Execute o script principal:
octave main_tsp.m
