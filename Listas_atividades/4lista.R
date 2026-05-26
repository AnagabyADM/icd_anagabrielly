# Correção
#exercicio 1 
#A) 
#Parametro de modelo:
#n-emails é a quantidade de contatos realizados em cada semana
n_emails <-  600
prob_conversao <- 0.07
n_semanas <-  5000

#Fixa a semente para que a simuãção possa ser produzida
set.seed(123)

#Simuda a quantidade de converção
conversoes <- rbinom(
  n = n_semanas,
  size = n_emails,
  prob = prob_conversao
)

#Mostra os dez primeiros valores simulados.
head(conversoes,10)

## B) Media, desvio padrao e quantis 5% e 95%
media_conversoes <- mean(conversoes)
media_conversoes

#Ocilação tipica em torno da media
dp_conversoes <- sd(conversoes)
dp_conversoes

# quantis 5% e 95%: faixa central de aproximidade 90% das semanas
faixa_central_conversoes <- quantiles(conversoes,c(0.05,0.95))
faixa_central_conversoes

# C) Proporção de semanas com menos de 35 conversoes
prob_baixo_desempenho <- mean(conversões < 35)
prob_baixo_desempenho

#D)Proporção de semanas com 55 conversões
prob_alto_desempenho <- mean (conversoes >=55)
prob_alto_desempenho

#e) Pag 16 slide semana 13 = com parametros usados, a media simulada fica próxima a 42 conversões por 
#semana. Portanto umaunica semana a baixo desse limite ainda parece uma variação
#plausivel do processo, não um sinal forte de problema por si so.
#Semana com 55 conversãoes ou mais.

# Exercicio 2
#Parametro do modelo
lambda <- 18
capacidade <- 22
n_horas <- 10000

#Fixa a semente para que a simulação possa ser reduzida
set.seed(456)

#simula muito cenarios plausiveis de atendimento em hora de pico.
clientes <- rpois(
  n = n_horas,
  lambda = lambda
)
#mostra os dez primeiros valores simulados
head(clientes,10)

#B) media e variancia simuladas
media_clientes <- mean(clientes)
media_clientes

variancia_clientes <- var(clientes)
variancia_clientes

#c) proporção de horas acima da capacidade anual
prob_saturação_anual <- mean(clientes > capacidade)
prob_saturação_anual

#D
capacidades_95 <- quantile(Clientes,0.95)
capacidades_95

# e)
# Clientes excedentes médios por hora.
# if_else() calcula o excedente quando há saturação e zero caso contrário.
excedente_medio_atual <- mean(
  if_else(clientes > capacidade, clientes - capacidade, 0))
excedente_medio_atual

#f)
# Comparação de políticas de capacidade.
capacidades <- c(20, 22, 25)

# Proporção de horas em que cada capacidade fica saturada.
prob_saturacao <- c(
  mean(clientes > 20),
  mean(clientes > 22),
  mean(clientes > 25)
)

# Clientes acima da capacidade, considerando todas as horas simuladas.
excedente_medio <- c(
  mean(if_else(clientes > 20, clientes - 20, 0)),
  mean(if_else(clientes > 22, clientes - 22, 0)),
  mean(if_else(clientes > 25, clientes - 25, 0))
)

ociosidade_media <- c(
  mean(if_else(clientes < 20, 20- clientes, 0)),
  mean(if_else(clientes < 22, 22 - clientes, 0)),
  mean(if_else(clientes < 25, 25 - clientes, 0))
)

politicas_capacidade <- tibble(
  capacidade = capacidades,
  prob_saturacao = prob_saturacao,
  excedente_medio = excedente_medio,
  ociosidade_media = ociosidade_media
)

# exibe o resultado
politicas_capacidade 


#G)A capacidade de 20 clientes por hora tem menor ociosidade, mas gera saturação 
#elevada: cerca de 27% DAS HORAS SIMULADAS FICAM ACIMA DA CAPACIDE
#A capacidade de 25 clientes por hora reduz a saturação para cercca e 5%, mas
#aumenta a capacidade ociosa media.
