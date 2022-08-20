library(tm)
library(wordcloud)
library(syuzhet)

hwip <- read.csv(file.choose(),header = T)

str(hwip)

corpus <- iconv(hwip$text)
corpus <- Corpus(VectorSource(corpus))

inspect(corpus[1:20])

#Data Cleaning

corpus <- tm_map(corpus, tolower)
inspect(corpus[1:20])

corpus <- tm_map(corpus, removePunctuation)
inspect(corpus[1:20])

corpus <- tm_map(corpus, removeNumbers)
inspect(corpus[1:20])

corpus <- tm_map(corpus, removeWords,stopwords("english"))
inspect(corpus[1:20])

corpus <- tm_map(corpus, stripWhitespace)
inspect(corpus[1:20])

hwip_final <- corpus
