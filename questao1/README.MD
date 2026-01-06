# Classificação Vertebral Column Dataset - Rede Neural RBF

## Descrição
Este projeto classifica o conjunto de dados Vertebral Column em três classes:
- Normal
- Disk Hernia
- Spondylolisthesis

Utilizando uma Rede Neural RBF com validação hold-out (70% treino, 30% teste).

## Pré-requisitos
- Octave instalado
- Dataset `column_3C.dat` do UCI Machine Learning Repository

## Instalação

1. Baixe o dataset:
   - Acesse: https://archive.ics.uci.edu/ml/datasets/Vertebral+Column
   - Baixe o arquivo `column_3C.dat`
   - Coloque o arquivo na mesma pasta do projeto

2. Verifique se o Octave está instalado:
octave --version## Estrutura dos Arquivos

- `main.m` - Script principal
- `normalizar_dados.m` - Normalização z-score
- `treinar_rbf.m` - Treinamento da rede RBF
- `predizer_rbf.m` - Predição usando RBF
- `calcular_acuracia.m` - Cálculo de acurácia
- `calcular_matriz_confusao.m` - Matriz de confusão
- `column_3C.dat` - Dataset (baixar do UCI)

## Como Executar

No terminal, navegue até a pasta do projeto e execute:

octave main.mOu dentro do Octave:
ctave
cd('/caminho/para/o/projeto')
main## Parâmetros Ajustáveis

No arquivo `main.m`, você pode ajustar:
- `num_centros` - Número de centros RBF (padrão: 15)
- `sigma_rbf` - Parâmetro sigma da função gaussiana (padrão: 1.0)
- `num_execucoes` - Número de execuções (padrão: 10)
- `proporcao_treino` - Proporção para treino (padrão: 0.7)

## Saída Esperada

O programa exibirá:
- Informações sobre os dados carregados
- Acurácia de cada uma das 10 execuções
- Acurácia média ± desvio padrão
- Melhor e pior acurácia
- Matriz de confusão média

## Observações

- O k-means pode gerar resultados ligeiramente diferentes em cada execução
- Ajuste os parâmetros `num_centros` e `sigma_rbf` para otimizar resultados
- O dataset possui 310 amostras com 6 atributos biomecânicos