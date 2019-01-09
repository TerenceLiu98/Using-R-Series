##################################
## Regression Analysis New Code ##
##################################

# Packages we may need 
library(VIM) # function aggr: visualize the missing value 
library(tidyverse) #To use ggplot2, tidyr, dplyr
library(plotly) #To create interactive plots
library(DT) #To display the data
library(magrittr) #To pipe operators
library(ggplot2) #To make and customize quickly plots
library(devtools) #To Make Developing R Packages Easier
library(lubridate) # date tranformation
library(beginr)

# read data and data pre-processing 
beijing.data <- read.csv("PRSA_data_2010.1.1-2014.12.31.csv", header = T) # load the data set
head(beijing.data)
tail(beijing.data)

sum(is.na(beijing.data))
aggr(beijing.data, prop = T, number = T)

i <- NULL
j <- 1
compare_value_j <- 1
for ( i in 2010:2014){
  data_i <- beijing.data[beijing.data$year == i,]
  if (compare_value_j < length(na.omit(data_i$pm2.5))){
    compare_value_j <- length(na.omit(data_i$pm2.5))
    j <- j + 1
  }
  print(j + 2009) # the year will least missing value 
}
beijing.data <- as_tibble(beijing.data)

# add a categorical variable: season 
i <- NULL
for ( i in 1:length(beijing.data$No)){
  if(beijing.data$month[i] == 1){
    beijing.data$season[i] <- 1
  }
  if(beijing.data$month[i] == 2){
    beijing.data$season[i] <- 1
  }
  if(beijing.data$month[i] == 3){
    beijing.data$season[i] <- 1
  }
  if(beijing.data$month[i] == 4){
    beijing.data$season[i] <- 2
  }
  if(beijing.data$month[i] == 5){
    beijing.data$season[i] <- 2
  }
  if(beijing.data$month[i] == 6){
    beijing.data$season[i] <- 2
  }
  if(beijing.data$month[i] == 7){
    beijing.data$season[i] <- 3
  }
  if(beijing.data$month[i] == 8){
    beijing.data$season[i] <- 3
  }
  if(beijing.data$month[i] == 9){
    beijing.data$season[i] <- 3
  }
  if(beijing.data$month[i] == 10){
    beijing.data$season[i] <- 4
  }
  if(beijing.data$month[i] == 11){
    beijing.data$season[i] <- 4
  }
  if(beijing.data$month[i] == 12){
    beijing.data$season[i] <- 4
  }
}
head(beijing.data)

# data cleaning 
cleanbeijing <-select(beijing.data, c("year","month","day","hour","season","pm2.5","cbwd","Iws", "Is", "Ir","DEWP", "TEMP", "PRES")) %>% 
  na.omit() %>% 
  filter(year >= 2013)%>%
  unite(timebyday, c("year", "month", "day"), remove = FALSE, sep = "-")
datatable(cleanbeijing, option = list(scrollX = TRUE))

#calculate the PM2.5 by day
daypm<-cleanbeijing%>%
  group_by(timebyday)%>%
  summarise(mean=mean(cleanbeijing$pm2.5))%>%
  as_tibble()
#calculate the PM2.5 by year
cleanbeijing$quality <- ifelse(cleanbeijing$pm2.5 <= 50, "good", 
                               ifelse(cleanbeijing$pm2.5 <= 100, "moderate", 
                                      ifelse(cleanbeijing$pm2.5 <= 300, "unhealthy", "posisonous")))
qualitypm <- cleanbeijing %>% 
  group_by(year, quality) %>%
  count() %>% 
  as_tibble()

ggplot(qualitypm, aes(x = factor(year) , y = n,fill = quality)) + geom_bar(stat = 'identity', position = 'dodge')+
  theme(legend.title = element_blank())

spring<-filter(cleanbeijing,cleanbeijing$season==1)
summer<-filter(cleanbeijing,cleanbeijing$season==2)
autumn<-filter(cleanbeijing,cleanbeijing$season==3)
winter<-filter(cleanbeijing,cleanbeijing$season==4)

seasonpm<- cleanbeijing %>%
  group_by(season,quality)%>%
  count()%>%
  as_tibble()

ggplot(seasonpm, aes(x = factor(season) , y = n,fill = quality)) + geom_bar(stat = 'identity', position = 'fill')+
  theme(legend.title = element_blank())

cleanbeijing <- as.data.frame(cleanbeijing)
cleanbeijing <- cleanbeijing[,-c(2,3,4)] 
head(cleanbeijing)
time <- cleanbeijing$timebyday
time <- as.Date(as.POSIXct(ymd(time), origin = "2013-01-01"))
cleanbeijing$timebyday <- time
cleanbeijing$timestamp <- as.numeric(cleanbeijing$timebyday)
head(cleanbeijing)
tail(cleanbeijing)

# Add the numericalized combined wind to the data set
for (i in 1:length(cleanbeijing$timebyday)){
  if(cleanbeijing$cbwd[i] == "NW"){
    cleanbeijing$cbwd_data[i] = 1
  }
  if(cleanbeijing$cbwd[i] == "cv"){
    cleanbeijing$cbwd_data[i] = 2
  }
  if(cleanbeijing$cbwd[i] == "NE"){
    cleanbeijing$cbwd_data[i] = 3
  }
  if(cleanbeijing$cbwd[i] == "SE"){
    cleanbeijing$cbwd_data[i] = 4
  }
}

# combine the data from one day 
  cleanbeijing_combin <- tapplydf(cleanbeijing, c("timestamp", "season", "pm2.5", "Iws", "Is", "Ir", "DEWP", "TEMP","PRES","cbwd_data"),"timebyday", mean)

  i <- NULL
  for ( i in 1:length(cleanbeijing_combin$timestamp)){
    if(month(cleanbeijing_combin$timebyday)[i] == 3){
      cleanbeijing_combin$season <- "Spring"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 4){
      cleanbeijing_combin$season[i] <- "Spring"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 5){
      cleanbeijing_combin$season[i] <- "Spring"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 6){
      cleanbeijing_combin$season[i] <- "Summer"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 7){
      cleanbeijing_combin$season[i] <- "Summer"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 8){
      cleanbeijing_combin$season[i] <- "Summer"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 9){
      cleanbeijing_combin$season[i] <- "Autumn"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 10){
      cleanbeijing_combin$season[i] <- "Autumn"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 11){
      cleanbeijing_combin$season[i] <- "Autumn"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 12){
      cleanbeijing_combin$season[i] <- "Winter"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 1){
      cleanbeijing_combin$season[i] <- "Winter"
    }
    if(month(cleanbeijing_combin$timebyday)[i] == 2){
      cleanbeijing_combin$season[i] <- "Winter"
    }
  }
  head(cleanbeijing_combin)

# new categoraical variable: cbwd 
  cleanbeijing_combin$cbwd_data <- floor(cleanbeijing_combin$cbwd_data)
  for (i in 1:length(cleanbeijing_combin$timebyday)){
    if(cleanbeijing$cbwd[i] == 1){
      cleanbeijing_combin$cbwd_data[i] = "NW"
    }
    if(cleanbeijing_combin$cbwd_data[i] == 2){
      cleanbeijing_combin$cbwd_data[i] = "cv"
    }
    if(cleanbeijing_combin$cbwd_data[i] == 3){
      cleanbeijing_combin$cbwd_data[i] = "NE"
    }
    if(cleanbeijing_combin$cbwd_data[i] == 4){
      cleanbeijing_combin$cbwd_data[i] = "SE"
    }
  }
  
lm.cleanbeijing_combin <- lm(log(pm2.5)~timestamp + season + Iws + Is + Ir + DEWP + TEMP + PRES + cbwd_data, data = cleanbeijing_combin)
summary(lm.cleanbeijing_combin)
  
  
  