# Arquivo: revisao-probabilidade.R
# Autor: Ana Gabrielly
# Data: 08/06/2026
# Objetivos:
# Exercícios de revisão para a avaliação 2

# Configurações globais -------------------------------------------

# exibe números sem notação científica
options(digits = 5, scipen = 999)

# Orientação:
# Nos Exercícios 1, 2 e 3, escreva as respostas como comentários.
# No Exercício 4, complete e execute o código em R.


# Exercício 1 -----------------------------------------------------
# Experimento, evento e variável aleatória

# a) É o conjunto de todos os resultados possíveis de um experimento aleatório,
# sendo usualmente representado por S
# S =[comprou, não comprou]


# b) Realização da compra, atribuição de receita a empresa.
#A = realizou a compra


# c) P(A) ou P(comprou)


# d) não. o  resultado é qualitativo ou categorico,
#somente quando define uma variavel categoriga terá um resultado qualitativo



# e) X = 1 → o cliente comprou após a campanha de e-mail;
#   X = 0 → o cliente não comprou.


# Exercício 2 -----------------------------------------------------
# Valor esperado em uma decisão simples

# a) Valores possíveis de X1=  500 se a garantia for acionada
# X2 = 0 se a garantia na˜o for acionada


# b) P(X1 = 500) =  Garantia acionada
# P(X=500)=0,04 


# c) P(X = 0) = Garantia não acionada
#P(X=0)=1−0,04
#P(X=0)=0,96


# d) 
#E(X)=(500⋅0,04)+(0⋅0,96)
#E(X)=20+0
#E(X)=20


# e) Interpretação do valor esperado: No contexto do problema, o valor esperado 
#de R$ 20,00 significa que, em média, a empresa tem um custo de R$ 20,00 
#por produto vendido com a garantia estendida esmo que para um produto específico 
#o custo seja R$ 0 ou R$ 500, ao considerar muitas vendas, 
#o gasto médio esperado da empresa com garantias será de aproximadamente R$ 20 por produto.


# Exercício 3 -----------------------------------------------------
# Escolha de distribuição de probabilidade

# a) Bernoulli
#pois há exatamente dois resultados possíveis compra, não compra


# b) Binomial
#a probabilidade de sucesso p é a mesma em todos os ensaios
#o resultado de interesse é o número total de sucessos nos n ensaios.


# c) Poisson
#conta-se o número de ocorrências de um evento em um intervalo fixo de tempo ou espaço;
#a taxa média de ocorrência por unidade é constante;
#ocorrências em subintervalos disjuntos são independentes entre


# d) Normal 
#distribuição normal é um modelo probabilístico usado para representar variáveis
#contínuas cujos valores se concentram em torno da média


# Exercício 4 -----------------------------------------------------
# Simulação com distribuição de Poisson
# escreva, complete e execute o código fornecido

#fixa a semente para que a simulação possa ser produzida
set.seed(123)

# parametros
lambda <- 12
capacidade <- 15
# quantidade de valores de x
n_simulacoes <- 1000
  
#simulação
  clientes <- rpois(n = 1000, lambda = 12)
#media
media_simulada <- mean(clientes)
media_simulada

#simulação capacidade
prop_acima_capacidade <- mean(clientes > capacidade )

#percentil
percentil_95 <- quantile( clientes, 0,95)
percentil_95
  
# e) Interpretação da capacidade atual
#A capacidade de 15 está atendedendo as nececidades, por prop_acima_capacidade
# é de 0,144
#O percentil 95 representa um valor tal que 95% das simulações tiveram contagem
#de clientes igual ou inferior a esse número, e apenas 5% ultrapassaram esse valor
#percentil de 3, a capacidade não esta sendo usada em sua totalidade
#Como a média é de aproximadamente 12 clientes e a capacidade é 15, a capacidade
#parece suficiente para a maioria das situações, mas pode se mostrar limitada em 
#parte dos horários de pico.