remove(list=ls())

library(httr)
library(readr)

#load data
url_cities <- "https://raw.githubusercontent.com/JiyaYUN/Professional-Communication-Round-3-City-Ranking/main/cities.csv"
url_costofliving <- "https://raw.githubusercontent.com/JiyaYUN/Professional-Communication-Round-3-City-Ranking/main/movehubcostofliving.csv"
url_qualityoflife <- "https://raw.githubusercontent.com/JiyaYUN/Professional-Communication-Round-3-City-Ranking/main/movehubqualityoflife.csv"

costofliving_response <- GET(url_costofliving)
qualityoflife_response <- GET(url_qualityoflife)

cities <- read.csv(url_cities)
costofliving <- read.csv(text = content(costofliving_response, "text"), fill = TRUE)
qualityoflife <- read.csv(text = content(qualityoflife_response, "text"), fill = TRUE, fileEncoding = "UTF-8")

#Safety.Rating
qualityoflife$Safety.Rating <- 100-qualityoflife$Crime.Rating

library(ggplot2)
ggplot(data = qualityoflife, aes(x = Safety.Rating)) +
     geom_histogram(binwidth = 1, fill = "blue", color = "black") +
     labs(title = "Distribution of Ratings", x = "Safety.Rating", y = "Frequency")

#Healthcare
ggplot(data = qualityoflife, aes(x = Health.Care)) +
     geom_histogram(binwidth = 1, fill = "blue", color = "black") +
     labs(title = "Distribution of Ratings", x = "Healthcare", y = "Frequency")

#Cinema
ggplot(data = costofliving, aes(x = Cinema)) +
     geom_histogram(binwidth = 1, fill = "blue", color = "black") +
     labs(title = "Distribution of Ratings", x = "Cinema", y = "Frequency")
which.max(costofliving$Cinema)
costofliving <- costofliving[-115, ]

#Cappuccino
ggplot(data = costofliving, aes(x = Cappuccino)) +
     geom_histogram(binwidth = 1, fill = "blue", color = "black") +
     labs(title = "Distribution of Ratings", x = "Cappuccino", y = "Frequency")

#Wine
ggplot(data = costofliving, aes(x = Wine)) +
     geom_histogram(binwidth = 1, fill = "blue", color = "black") +
     labs(title = "Distribution of Ratings", x = "Wine", y = "Frequency")

costofliving$SocialNeeds <- costofliving$Cappuccino + costofliving$Cinema + costofliving$Wine
