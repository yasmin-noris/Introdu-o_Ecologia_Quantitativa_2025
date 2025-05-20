
# Curso: Introdução à Ecologia Quantitativa
# Tópicos 1 a 3 com explicações e exemplos

# --------------------------------------------
# 1. TIPOS DE VARIÁVEIS
# --------------------------------------------
cat("1. Tipos de Variáveis\n\n")
cat("Variáveis podem ser classificadas de acordo com sua natureza:\n")
cat("- Qualitativas (Categóricas):\n")
cat("  * Nominais: sem ordem natural (ex: tipo de vegetação: floresta, campo, cerrado)\n")
cat("  * Ordinais: com ordem natural (ex: classe de qualidade da água: ruim, regular, boa)\n")
cat("- Quantitativas (Numéricas):\n")
cat("  * Discretas: contáveis (ex: número de indivíduos de uma espécie)\n")
cat("  * Contínuas: medidas (ex: temperatura da água, pH)\n\n")

# Exemplo de classificação
variaveis <- data.frame(
  Vegetacao = c("Floresta", "Campo", "Cerrado"),
  Qualidade_agua = c("Boa", "Regular", "Ruim"),
  Num_individuos = c(34, 50, 12),
  Temperatura = c(25.6, 27.1, 24.3)
)
print(variaveis)

# --------------------------------------------
# 2. DELINEAMENTO AMOSTRAL
# --------------------------------------------
cat("\n2. Delineamento Amostral\n\n")
cat("É o planejamento da coleta de dados. Tipos comuns:\n")
cat("- Aleatória simples: cada unidade tem a mesma chance de ser escolhida\n")
cat("- Estratificada: divide-se em grupos antes da amostragem\n")
cat("- Sistemática: coleta a cada k unidades\n")
cat("- Em blocos: unidades agrupadas com características semelhantes\n")
cat("Objetivo: garantir representatividade e reduzir viés.\n\n")

# Simulação de amostragem aleatória simples
set.seed(123)
dados_total <- 1:100
amostra_simples <- sample(dados_total, size = 10)
cat("Exemplo de amostragem aleatória simples (10 valores de 1 a 100):\n")
print(amostra_simples)

# --------------------------------------------
# 3. ESTATÍSTICA DESCRITIVA
# --------------------------------------------
cat("\n3. Estatística Descritiva\n\n")
cat("Permite resumir os dados com medidas numéricas e gráficos:\n")
cat("- Média: tendência central\n")
cat("- Mediana: valor central\n")
cat("- Moda: valor mais frequente\n")
cat("- Desvio padrão (SD): dispersão dos dados\n")
cat("- Coeficiente de variação (CV): SD / média\n\n")

# Exemplo com vetor de dados
abundancia <- c(10, 15, 10, 20, 18, 17, 22, 10, 19, 21)
media <- mean(abundancia)
mediana <- median(abundancia)
moda <- as.numeric(names(sort(table(abundancia), decreasing=TRUE)[1]))
desvio <- sd(abundancia)
cv <- (desvio / media) * 100

cat("Dados de abundância:\n")
print(abundancia)
cat(sprintf("Média: %.2f\n", media))
cat(sprintf("Mediana: %.2f\n", mediana))
cat(sprintf("Moda: %d\n", moda))
cat(sprintf("Desvio padrão: %.2f\n", desvio))
cat(sprintf("Coeficiente de variação: %.2f%%\n", cv))

# Gerar gráficos (necessita pacote ggplot2)
if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)

df_abund <- data.frame(Abundancia = abundancia)

# Histograma
ggplot(df_abund, aes(x = Abundancia)) +
  geom_histogram(binwidth = 2, fill = "skyblue", color = "black") +
  theme_minimal() +
  ggtitle("Histograma da Abundância")

# Boxplot
ggplot(df_abund, aes(y = Abundancia)) +
  geom_boxplot(fill = "lightgreen") +
  theme_minimal() +
  ggtitle("Boxplot da Abundância")
