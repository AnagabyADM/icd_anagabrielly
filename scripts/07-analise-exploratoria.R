# Arquivo: 07-analise-exploratoria.R
# Autor(a): Ana Gabrielly
# Data: 25/05/2026
# Objetivos:
# 1. Calcular estatísticas descritivas amostrais.
# 2. Visualizar a distribuição empírica dos dados.
# 3. Comparar padrões entre grupos.

# 0. Configurações globais ---------------------------------------------

# Controla a forma como os valores numéricos aparecem no console.
options(digits = 5, scipen = 999)

# Carrega os pacotes usados para caminhos, manipulação e visualização.
library(here)
library(tidyverse)
library(tidyplots)

# Permite que os gráficos do tidyplots usem o espaço disponível.
tidyplots_options(width = NA, height = NA)

caminho_dados <- here("dados/limpos/dados_marketing_limpos.rds")

#carregar os dados
dados_marketing <- read_rds(caminho_dados)

#conferir variaveis
glimpse(dados_marketing)

#2-----------------------------------------------
#verificar o tamanho dos dados
dim(dados_marketing)

#lista os nomes das variaveis
names(dados_marketing)

#mostrar as primeiras linhas para uma inspeção
head(dados_marketing)

#conta quantas semanas aparecem em cada situação
dados_marketing |> 
  count(status_promocao)

#3--------------------------------------------------
# calcula estatistica inicial
inspecao_receita <- dados_marketing |> 
  sumarize(
    n = n(),
    minimo = min(receita_vendas),
    maximo = max(receita_vendas),
    amplitude = max(receita_vendas) -
      min(receita_vendas)
  )
#mostrar tabela
inspecao_receita

#4--------------------------------------------------------
#distribuição empirica
dados_marketing |> 
  tidyplot(x = receita_vendas) |> 
  add_histogram(bins = 20)