i <- NULL
for ( i in 1:length(cleanbeijing_combin$timestamp)){
    if(beijing.data$month[i] == 3){
        beijing.data$season[i] <- "Spring"
    }
    if(beijing.data$month[i] == 4){
        beijing.data$season[i] <- "Spring"
    }
    if(beijing.data$month[i] == 5){
        beijing.data$season[i] <- "Spring"
    }
    if(beijing.data$month[i] == 6){
        beijing.data$season[i] <- "Summer"
    }
    if(beijing.data$month[i] == 7){
        beijing.data$season[i] <- "Summer"
    }
    if(beijing.data$month[i] == 8){
        beijing.data$season[i] <- "Summer"
    }
    if(beijing.data$month[i] == 9){
        beijing.data$season[i] <- "Autumn"
    }
    if(beijing.data$month[i] == 10){
        beijing.data$season[i] <- "Autumn"
    }
    if(beijing.data$month[i] == 11){
        beijing.data$season[i] <- "Autumn"
    }
    if(beijing.data$month[i] == 12){
        beijing.data$season[i] <- "Winter"
    }
    if(beijing.data$month[i] == 1){
        beijing.data$season[i] <- "Winter"
    }
    if(beijing.data$month[i] == 2){
        beijing.data$season[i] <- "Winter"
    }
}
head(cleanbeijing_combin)
