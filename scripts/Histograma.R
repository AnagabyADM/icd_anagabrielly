# Arquivo: 08-analise-exploratoria-grafica.R
# Autor(a): Ana gabrielly
# Data: 22/06/2026
# Objetivos:
# 1. Criar histograma da receita semanal de vendas com tidyplots
# 2. Criar boxplot da receita semanal de vendas com tidyplots
# 3. Criar boxplot comparativo da receita semanal de vendas com tidyplots
#    entre semanas com e sem promoção

# 0. Pacotes e opções globais --------------------------------------------

# Opções de exibição numérica
options(digits = 5, scipen = 999)

# Pacotes usados nesta aula
library(here)
library(tidyverse)
library(tidyplots)


#Importação dos arquivos
caminho_dados <- here ("dados/limpos/dados_marketing_limpos.rds")

dados_marketing <- read_rds(caminho_dados)

#estrutura
glimpse(dados_marketing)

# Carrega o conjunto de dados Anscombe, disponível no R
data(anscombe)
head(anscombe)

#1 histologia da receita
#gerar Histograma da receita

dados_marketing |> 
  tidyplot(x = `Receita Vendas`) |> 
  add_histogram(bins = 9)

# 2. Estatísticas de apoio para interpretar o histograma -------------

# Resume o centro da receita semanal.
# Servem só para apoiar a leitura do gráfico, não para substituí-la.
resumo_histograma <- dados_marketing |>
  summarize(
    media = mean(`Receita Vendas`),
    mediana = median(`Receita Vendas`)
  )

# Exibe o resumo calculado.
resumo_histograma

# 3 histograma para publicação
# verificação
dados_marketing |> 
  tidyplot(x = `Receita Vendas`) |> 
  add_histogram(bins = 9, fill = "steelblue") |> 
  adjust_x_axis_title("receita semanal de  vendas(em US$ mil") |> 
  adjust_y_axis_title("Número de semanas") |> 
  add_caption("Fonte: dados simulados pelo professor") |> 
  adjust_font(fontsize = 14)

# 4 boxplot da receita
dados_marketing |> 
  tidyplot(y = `Receita Vendas`) |> 
  add_boxplot()

# 5 estatisticas por status de promoção
#compara semanas com e sem promoção
estatisticas_comparativas <- dados_marketing |> 
  group_by(status_promocao) |> 
  summarise(
    n = n(),
    media = mean(`Receita Vendas`),
    mediana = median(`Receita Vendas`),
    cv = sd(`Receita Vendas`) / mean(`Receita Vendas`) * 100
  )

# resultado
estatisticas_comparativas

#6 boxplot comparartivo
#semanal
dados_marketing |> 
  tidyplot(x = status_promocao, y = `Receita Vendas`) |> 
  add_boxplot()