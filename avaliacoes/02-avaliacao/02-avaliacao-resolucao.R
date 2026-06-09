# Arquivo: 02-avaliacao-resolucao.R
# Integrante 1: Ana Gabrielly da Silva Lima
# Integrante 2: Cristina Pereira
# Integrante 3: Leticia Rodrigues
# Integrante 4: Leticia Vilela
# Data: 09/06/2026
# Objetivo: Resolução da Avaliação 2 — Introdução à Ciência de Dados


# Configurações globais ---------------------------------------
options(digits = 5, scipen = 999)

# Exercício 1 -------------------------------------------------

# a) É o conjunto de todos os resultados possíveis de um experimento aleatório,
# sendo usualmente representado por S
# S =[renovou, não renovou]

#

# b)  Um evento associado à renovação de contrato é: 
#A = {Renovação}
# A é o evento "o cliente renova o contrato".
#

# c) P(A) ou P(renovou)
#

# d) não. o  resultado é qualitativo ou categorico,
#somente quando define uma variavel categoriga terá um resultado qualitativo
#

# e)  X = 1 se o cliente renovou o contrato;
# X = 0 se o cliente não renovou o contrato.
#

# f) Bernoulli pois a variavel aleatoria pode assumir apenas dois valores.
#renova ou não renova



# Exercício 2 -------------------------------------------------

# a)  X pode assumir dois valores:
# X = 12, quando o cupom é utilizado;
# X = 0, quando o cupom não é utilizado
#

# b) P(X = 12) = 0,10
#

# c) P(X = 0) = 1 - 0,10 = 0,90.
#

# d)alor esperado de X:
# E(X) = X1 * P(X = 12) + X2 * P(X = 0)
# E(X) = 12 * 0,10 + 0 * 0,90 
# E(X) = R$ 1,20
#

# e)O valor esperado de R$ 1,20 representa o custo médio do desconto por cliente
#que recebe o cupom, considerando muitos clientes.
#Embora cada cliente gere um custo de R$ 0,00 ou R$ 12,00, 
#a loja pode esperar gastar, em média, R$ 1,20 por cupom distribuído ao longo 
#de um grande número de clientes.
#



# Exercício 3 -------------------------------------------------

# Digite e execute o código necessário e escreva a 
# interpretação em comentários.



#fixa a semente para que a simulação possa ser produzida
set.seed(123)

# parametros
lambda <- 10
capacidade <- 13
# quantidade de valores de x
n_simulacoes <- 1000

#simulação
clientes <- rpois(n = 1000, lambda = 10)
#media
media_simulada <- mean(clientes)
media_simulada

#simulação capacidade
prop_acima_capacidade <- mean(clientes > capacidade )

#percentil
percentil_95 <- quantile( clientes, 0,95)
percentil_95


#interpretação
# A média simulada ficou próxima de 10 clientes por hora, como esperado
# pelo modelo Poisson(lambda = 10).
#
# A capacidade de 13 clientes foi excedida em cerca de 9,825 dos valores
# simulados. Portanto, em uma hora de pico sob esse modelo, a unidade ficaria
# acima da capacidade com alguma frequência.

# Assim, se a prioridade for reduzir saturação no horário de pico,
# a capacidade atual de 13 clientes por hora parece limitada. Se a unidade
# aceitar alguma espera em parte das horas de pico, essa capacidade ainda
# pode ser defendida, mas com risco operacional visível.