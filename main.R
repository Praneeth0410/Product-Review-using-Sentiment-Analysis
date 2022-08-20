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
tdm <- TermDocumentMatrix(hwip_final)
tdm <- as.matrix(tdm)
tdm[1:50,1:20]

w <- rowSums(tdm)
w <- subset(w, w>=25)
barplot(w, las = 2,col="blue")




w <- sort(rowSums(tdm), decreasing = T)
set.seed(2000)
wordcloud(words = names(w), freq = w, max.words = 75,
          random.order = F,min.freq = 10,
          colors = brewer.pal(75,"Dark2"),
          scale = c(1,0.3))




sentiment_data <- iconv(hwip$text)
s <- get_nrc_sentiment(sentiment_data)
s[1:20,]


s$score <- s$positive - s$negative
s[1:20,]

write.csv(x = s, file = "C:\\mini project\\hwip_2.csv")

review_score <- colSums(s[,])
print(review_score)

barplot(colSums(s))
