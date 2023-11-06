remove(list=ls())

library(httr)
library(readr)

url_cities <- "https://raw.githubusercontent.com/JiyaYUN/Professional-Communication-Round-3-City-Ranking/main/cities.csv"
url_costofliving <- "https://raw.githubusercontent.com/JiyaYUN/Professional-Communication-Round-3-City-Ranking/main/movehubcostofliving.csv"
url_qualityoflife <- "https://raw.githubusercontent.com/JiyaYUN/Professional-Communication-Round-3-City-Ranking/main/movehubqualityoflife.csv"


costofliving_response <- GET(url_costofliving)
qualityoflife_response <- GET(url_qualityoflife)

cities <- read.csv(url_cities)
costofliving <- read.csv(text = content(costofliving_response, "text"), fill = TRUE)
qualityoflife <- read.csv(text = content(qualityoflife_response, "text"), fill = TRUE)