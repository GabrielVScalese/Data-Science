tabela <- read.csv('C:\\Users\\gabri\\Desktop\\Repositorios\\Data-Science\\Pokemon.csv', 
                  header = T, sep = ',') # header: tem cabecalho
                                         # sep: usa virgula para separar colunas
# Remove objeto
#(table)

# Criacao de tabela de frequencia (count de uma coluna)
tabelaFrequencia <- table(table$Type.1)

# Exibe a tabela
# View(tabelaFrequencia)

# Salvo num objeto
tabFreq <- as.data.frame(table(tabela$Type.1))

# Renomea as colunas da tabela
names(tabFreq) <- c("tipoPokemon","frequencia")

# ggplot -> criar grafico / geom_bar -> tipo de grafico (barras)
ggplot() + geom_bar(data = tabFreq, aes(x = tipoPokemon, y = frequencia), stat = "identity")

# Retorna a media de uma coluna
# mean(table$Attack)

# Retorna a media de ataque por tipo de pokemon
mediaAtaque <- ddply(tabela, ~Type.1, summarise, mean = mean(Attack))

ggplot() + geom_bar(data = mediaAtaque, aes(x = Type.1, y = mean),
                    stat = "identity") + ggtitle("Media de ataque por Tipo de pokemon")


