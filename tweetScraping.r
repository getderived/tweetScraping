#CÓDIGO PARA EXTRAÇÃO DE DADOS DO TWITTER - V.1

#Chaves de acesso ao Twitter via app (projetoCalvo):
consumer_key <- "7zIi6gmeF4ZJVb6poec43Dvhf"
consumer_secret <- "8aPOKiyg4mdOQxhCqZa2eOyMJdaB4Nt0TlOEchpZrEjVrkIHi3"
access_token <- "733757848031789057-Ta4JQTeBLTZlKhL9ov1uKqvVyakdw9K"
access_secret <- "w0Xw9aF34HEQEG6Gu9IFH02veE4uommSG8JAZGfghan7F"

#Usamos agora a função "setup_twitter_oauth" e nos conectamos ao Twitter via R:
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

#Buscando os tweets desejados:
tweets <- searchTwitter("filho de Lula", n = 15000)
head(tweets)
class(tweets)
tweets[[1]]
class(tweets[[1]])

#Observando data e hora, texto, se é retweet ou não, contagem de retweets, "nome da tela do usuário", o id do usuário, etc.:
str(tweets[[1]])

#Transformando os dados de lista para data frame via função do twitteR:
df.tweets <- twListToDF(tweets)
names(df.tweets)
View(df.tweets)

#Para limparmos os retweets da lista de tweets:
tweets_noret <- strip_retweets(tweets, strip_manual = TRUE, strip_mt = TRUE)
df.tweets_noret <- twListToDF(tweets_noret)
