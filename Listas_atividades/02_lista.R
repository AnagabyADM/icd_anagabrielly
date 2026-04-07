# Arquivo: 02-lista.R
# Autor(a): Ana Gabrielly
# Data: 07/04/2026
# Objetivo:
# 1. Resolver os exercícios da lista 2


# Configurações globais ---------------------------------------------------

# Configura o número de dígitos a serem exibidos
options(digits = 5, scipen = 999)

# carrega os pacotes necessários


# Exercicio 1 -------------------------------------------------------------


## a)
library(here)
library(tidyverse)
library(janitor)

## b)

# define o caminho relativo do arquivo de dados
caminho_csv <- here("dados/brutos/dados-marketing.csv") 

  dados_marketing <- read_csv(caminho_csv)


## c)
  glimpse(dados_marketing)



# Exercicio 2 -------------------------------------------------------------

## a)o que cada linha (observação) do arquivo representa?
  # Cada linha Representa a data, alguns gastos e atividades/Receitas recorrentes referente ao Marketing.


## b)quantas observações e quantas variáveis há no objeto dados_marketing?
  Variaveis : 156
  Observações: 9

# Exercicio 3 -------------------------------------------------------------

## a)
  dados_marketing_limpos <- dados_marketing |>
    clean_names()
  
## b)
  names(dados_marketing_limpos)


# Exercicio 4 -------------------------------------------------------------
  dados_marketing_limpos |>
    select(data, mes, gasto_tv, gasto_radio, promocao, receita_vendas)
  

# Exercicio 5 -------------------------------------------------------------
  dados_marketing_limpos <- dados_marketing_limpos |>
    mutate(
      gasto_total = gasto_tv + gasto_radio + gasto_redes_sociais + gasto_email
    )
  
  # mostra as colunas solicitadas
  dados_marketing_limpos |>
    select(data, mes, gasto_total, receita_vendas)
  
  # visualiza o objeto no RStudio
  View(dados_marketing_limpos)
  
# Exercicio 6 -------------------------------------------------------------




# Exercicio 7 -------------------------------------------------------------




# Exercicio 8 -------------------------------------------------------------





# Exercicio 9 -------------------------------------------------------------