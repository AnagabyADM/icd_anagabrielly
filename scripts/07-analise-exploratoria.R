# Arquivo: 07-analise-exploratoria-numerica.R
# Autor(a): <seu nome>
# Data: 15/06/2026
# Objetivos:
# 1. Carregar e inspecionar os dados de marketing
# 2. Calcular estatísticas amostrais de centro, posição e variabilidade
# 3. Interpretar a receita semanal com base nos dados observados

# 0. Pacotes e opções globais --------------------------------------------

# Opções de exibição numérica
options(digits = 5, scipen = 999)

# Pacotes usados nesta aula
library(here)
library(tidyverse)

# Caminho do arquivo de dados limpos
caminho_dados <-  here("dados/limpos/dados_marketing_limpos.rds")

# Leitura dos dados de marketing
dados_marketing <- read_rds(caminho_dados)

# estrutura dos dados carregados
glimpse(dados_marketing)


# 2. Inspeção inicial ------------------------------------------

# dimensões da base
dim(dados_marketing)

# nomes das variáveis 
names(dados_marketing)

# primeiras linhas da base
head(dados_marketing)

# contagem de semanas por status de promoção
dados_marketing |> 
  count(status_promocao)


# 3. Valores típicos da receita ------------------------------------

# Resumo com medidas amostrais de centro
estatistica_centro <-  dados_marketing|>
  summarise(
    # Média amostral
    media = mean(receita_vendas)
  )

# Exibe o resumo calculando 
estatistica_centro


# 4. Resumo rapido da receita ---------------------------------------

# Extrair a columa receita_vendas como um setor
receita <- dados_marketing |>
  pull(receita_vendas)

# Resumo amostral básico
summary(receita)
summary(dados_marketing $ status_promocao)

df <- 
  dados_marketing |> 
  mutate(promocao = factor(status_promocao))

# Para variáveis discretas
summary(df$promocao)

# 5. quantis da receita--------------------------------------------

# Quantis amostris selecionados

quantis_receita <- dados_marketing|>
  summarise(
    # Minimo amostral e percentil 5
    p0 = quantile(receita_vendas,0),
    p5 = quantile(receita_vendas, 0.05),
    
    # Quartis amostrais
    q1 = quantile(receita_vendas,0.025),
    mediana = quantile(receita_vendas, 0.50),
    q3 = quantile(receita_vendas, 0,75),
    
    # Percentil 95 e maximo amostral
    p95 = quantile(receita_vendas, 0.95),
    p100 = quantile(receita_vendas,1)
    
  )

#6. Vriabilidade da receita-------------------------------------------------

#resumo com medidas amostrais de variabilidade
estatisticas_variabilidade <- dados_marketing |> 
  summarize(
    #amplitude amostral
    amplitude = max(receita_vendas) - min(receita_vendas),
    
    # variancia amostral
    variancia = var(receita_vendas),
    
    #desvio padrão amostral
    desvio_padrao = sd(receita_vendas),
    
    #intervalo interquantil amostral
    iqr = IQR(receita_vendas)
  )

#7 coeficiente de variação

# resumo com media,desvio padrão e cv amostrais
cv_receita <- dados_marketing |> 
  sumarize(
    #media amostral
    media = mean(receita_vendas),
    
    #desvio padrão
    desvio_padrao = sd(receita_vendas),

    #cv amostral
    cv_percentual = 100 * desvio_padrao / media
  )
# resultado
cv_receita