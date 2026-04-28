# Arquivo: 03-lista.R
# Autor(a): Ana Gabrielly
# Data: 14/04/2026
# Objetivo: Resolução da Lista de Exercícios 3

# Configurações globais --------------------------------------

# Configura o número de dígitos exibidos
options(digits = 5, scipen = 999)

# Carrega os pacotes necessários
library(here)
library(tidyverse)


# Exercício 1 ------------------------------------------------

## a
caminho_csv <- here("dados/brutos/receitas_trimestres.csv")
dados_receita <- read_csv(caminho_csv)





## b
glimpse(dados_receita)



## c
# Produtos esta como observação e deveria estar como variavel para estar organizada.

## d
receitas_longas <- dados_receita |> 
  pivot_longer(
    cols = c("T1","T2","T3","T4"),
    names_to = "trimestre",
    values_to = "receitas"
  )

receitas_longas


## e
view(receitas_longas)


# Exercício 2 ------------------------------------------------


## a
caminho_csv <- here("dados/brutos/desempenho-empresa.csv")
dados_desempenho <- read_csv(caminho_csv)


## b
glimpse(dados_desempenho)

## c
# As receitas e despesas nas linhas como observações na verdade são variaveis

## d
desempenho_longos <- dados_desempenho |> 
  pivot_longer(
    cols = -empresa,
    names_to = c("indicador", "trimestre"),
    names_sep = "_",
    values_to = "valor"
  )

desempenho_longos

## e

view(desempenho_longos)


# Exercício 3 ------------------------------------------------


## a
caminho_csv <- here("dados/brutos/produtos.csv")
dados_produtos <- read_csv(caminho_csv)

caminho_csv <- here("dados/brutos/vendas.csv")
dados_vendas <- read_csv(caminho_csv)

caminho_csv <- here("dados/brutos/clientes.csv")
dados_clientes <- read_csv(caminho_csv)

## b
glimpse(dados_produtos)

glimpse(dados_vendas)

glimpse(dados_clientes)

## c
vendas_produtos <- dados_vendas|> 
  left_join(dados_produtos, by = "codigo_produto")
# resultado
vendas_produtos

glimpse(vendas_produtos)

view(vendas_produtos)


## d
relatorio_vendas <- dados_clientes|> 
  left_join(vendas_produtos, by = "id_cliente")
# resultado
relatorio_vendas

glimpse(relatorio_vendas)

view(relatorio_vendas)

## e


## f


## g


## h


## i