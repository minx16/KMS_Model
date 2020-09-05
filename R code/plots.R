rm(list=ls())
library(tidyverse)
library(geosphere) 
library(readxl)
library(rgeos)
library(zoo)
library(sp)
library(rlist)
library(LICORS)


#Population
setwd("download data")
census_in_states <- read.csv("census in states.csv", header = T, stringsAsFactors = FALSE, sep = ",") %>%
  transmute(fips = as.character(STATE),
            population = as.numeric(POPESTIMATE2019)) %>%
  filter(! fips %in% c("0", "72")) %>%
  mutate(fips = str_pad(fips, 2, pad = "0"))

#JHU
{
  jhu_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv"
  raw_data <- read_csv(jhu_url) %>%
    select(-UID, -iso2, -iso3, -code3, -Admin2, -Country_Region, -Lat, -Long_, -Combined_Key)
  colnames(raw_data)[1:2] <- c("fips", "state")
  raw_data$fips <- str_pad(raw_data$fips, 5, pad = 0)
  raw_data$fips <- substr(raw_data$fips, 1, 2)
  raw_data <- raw_data %>%
    group_by(fips, state) %>%
    summarise_all(sum) %>%
    filter(! fips %in% c("00", "72", "80", "88", "90", "99", NA))
  
  stylized_data <- list()
  for (i in 1:nrow(raw_data)){
    this_state <- data.frame(fips = character(ncol(raw_data)-2),
                             state = character(ncol(raw_data)-2),
                             date = as.Date(ncol(raw_data)-2),
                             cases = numeric(ncol(raw_data)-2))
    this_state$fips <- raw_data$fips[i]
    this_state$state <- raw_data$state[i]
    this_state$date <- seq(as.Date("2020-01-22"), as.Date("2020-08-26"), 1)
    this_state$cases <- as.numeric(raw_data[i,-(1:2)])
    this_state <- this_state %>%
      filter(cases > 0)
    stylized_data[[i]] <- this_state
  }
  state_covid <- bind_rows(stylized_data) %>%
    left_join(census_in_states,
              by = "fips")
  
  state_covid_features <- list()
  for (i in 1:length(unique(state_covid$fips))){
    this_fips <- unique(state_covid$fips)[i]
    this_state_covid <- state_covid %>%
      filter(fips == this_fips) %>%
      arrange(date) %>%
      mutate(new_cases = c(cases[1], cases[-1] - cases[-length(cases)])) %>%
      mutate(new_cases = replace(new_cases, new_cases<0, 0)) %>%
      mutate(cases_1w_avg = rollmean(new_cases, 7, na.pad = TRUE, align = "right")) %>%
      mutate(cases_2w_avg = rollmean(new_cases, 14, na.pad = TRUE, align = "right"))
    
    for (j in 1:6){
      this_state_covid$cases_1w_avg[j] <- mean(this_state_covid$new_cases[1:j])
    }
    for (j in 1:13){
      this_state_covid$cases_2w_avg[j] <- mean(this_state_covid$new_cases[1:j])
    }
    
    this_state_covid <- this_state_covid %>%
      mutate(new_cases = new_cases/population*1000000) %>%
      mutate(cases_1w_avg = cases_1w_avg/population*1000000) %>%
      mutate(cases_2w_avg = cases_2w_avg/population*1000000) %>%
      mutate(cases_increase = c(0, (new_cases[-1] - new_cases[-length(new_cases)])/new_cases[-length(new_cases)]*100)) %>%
      mutate(cases_1w_avg_increase = c(0, (cases_1w_avg[-1] - cases_1w_avg[-length(cases_1w_avg)])/cases_1w_avg[-length(cases_1w_avg)]*100)) %>%
      mutate(cases_2w_avg_increase = c(0, (cases_2w_avg[-1] - cases_2w_avg[-length(cases_2w_avg)])/cases_2w_avg[-length(cases_2w_avg)]*100))
    
    this_state_covid[is.na(this_state_covid)] <- 0 #0/0=nan
    this_state_covid$cases_increase[is.infinite(this_state_covid$cases_increase)] <- 100.1 #int/0=inf
    this_state_covid$cases_1w_avg_increase[is.infinite(this_state_covid$cases_1w_avg_increase)] <- 100.1 #int/0=inf
    this_state_covid$cases_2w_avg_increase[is.infinite(this_state_covid$cases_2w_avg_increase)] <- 100.1 #int/0=inf
    
    state_covid_features[[i]] <- this_state_covid
  }
  state_covid_data <- bind_rows(state_covid_features) %>%
    select(-cases, -population)
  
}


#Parameters
current_day <- max(state_covid_data$date)
predict_periods <- seq(1, 20, 1)
num_centers_list <- c(530, 370, 370, 370, 335, 635, 320, 370, 370, 370, 370, 375, 375, 370, 375,
                      375, 375, 375, 315, 315, 325, 330, 325, 330, 330, 330,
                      330, 330, 330, 330)
seed = 12345

#Algorithm
clustering_features <- state_covid_data %>%
  filter(date <= current_day) %>%
  select(-date, -state, -fips)
clustering_features <- as.data.frame(scale(clustering_features))

prediction_results <- state_covid %>%
  filter(date == current_day)

for (j in 1:length(predict_periods)){
  print(j)
  num_centers <- num_centers_list[j]

  set.seed(seed)
  Kmeans_model <- kmeans(clustering_features, centers = num_centers, algorithm="Lloyd", iter.max = 1000)
  clusters_data <- state_covid_data %>%
    filter(date <= current_day) %>%
    select(fips, date, new_cases) %>%
    mutate(cluster = as.factor(Kmeans_model$cluster))

  covid_predict <- data.frame(fips = character(length(unique(state_covid$fips))),
                              cases_predict = numeric(length(unique(state_covid$fips))),
                              stringsAsFactors = FALSE)
  for (n in 1:length(unique(state_covid$fips))){
    this_fips <- unique(state_covid$fips)[n]
    this_state_data <- clusters_data %>%
      filter(fips == this_fips)
    this_cluster <- this_state_data$cluster[which(this_state_data$date == current_day)]
    covid_predict$fips[n] <- this_fips
    this_cluster_data <- clusters_data %>%
      filter(cluster == this_cluster)
    historical_data <- this_cluster_data %>%
      select(fips, date) %>%
      filter(date <= current_day - predict_periods[j]) 
    trajectory_data <- historical_data
    
    for (i in 1:predict_periods[j]){
      trajectory <- historical_data %>%
        mutate(date = date + i) %>%
        left_join(clusters_data,
                  by = c("fips", "date")) %>%
      select(-cluster)
      trajectory_data <- trajectory_data %>%
        mutate(date = date + 1) %>%
        left_join(trajectory,
                  by = c("fips", "date"))
    }

    if (nrow(trajectory_data) == 0){
      covid_predict$cases_predict[n] <- mean(this_cluster_data$new_cases)*predict_periods[j]
    } else {
      new_cases_weekly <- apply(as.data.frame(trajectory_data[,-(1:2)]), 1, sum)
      covid_predict$cases_predict[n] <- min(mean(new_cases_weekly), 
                                            max(this_state_data$new_cases)*predict_periods[j])
    }
  }
  
  colnames(covid_predict)[2] <- paste("cases_predict_", j, sep = "")
  
  prediction_results <- prediction_results %>%
    left_join(covid_predict,
              by = "fips")
  
}


##Plot
cum_cases_results <- prediction_results

for (i in 6:ncol(cum_cases_results)){
  cum_cases_results[,i] <- cum_cases_results[,i]*cum_cases_results$population/1000000
  cum_cases_results[,i] <- cum_cases_results[,i] + cum_cases_results$cases
}

setwd("")
x_time <- seq.Date(as.Date("2020/1/1"), by = "month", length = 10)

for (j in 1:nrow(prediction_results)){
  print(j)
  this_fips <- prediction_results$fips[j]
  this_state <- prediction_results$state[j]
  old_cases <- state_covid %>%
    filter(fips == this_fips) %>%
    filter(date <= current_day) %>%
    select(date, cases)
  forecast_cases <- data.frame(date = as.Date(length(predict_periods)),
                               cases = numeric(length(predict_periods)),
                               stringsAsFactors = FALSE)
  forecast_cases$date <- seq(current_day+1, current_day+length(predict_periods), 1)
  forecast_cases$cases <- as.numeric(cum_cases_results[j,-(1:5)])
  for (i in 2:nrow(forecast_cases)){
    if (forecast_cases$cases[i] < forecast_cases$cases[i-1]){
      forecast_cases$cases[i] <- forecast_cases$cases[i-1]
    }
  }
  full_cases <- rbind(old_cases, forecast_cases)
  
  full_new_cases <- full_cases %>%
    transmute(date = date,
              new_cases = cases) 
  for (i in nrow(full_new_cases):2){
    full_new_cases$new_cases[i] <- full_new_cases$new_cases[i] - full_new_cases$new_cases[i-1]
  }
  full_new_cases <- full_new_cases %>%
    mutate(cases_1w_avg = rollmean(new_cases, 7, na.pad = TRUE, align = "right"))
  for (i in 1:6){
    full_new_cases$cases_1w_avg[i] <- mean(full_new_cases$new_cases[1:i])
  }
  old_new_cases <- full_new_cases %>%
    filter(date <= current_day)
  
  plot_name <- paste(this_state, ".eps", sep = "")
  setEPS()
  postscript(plot_name, family = "Times")
  par(mar=c(6,6,6,10), family = "Times")
  
  if (max(full_cases$cases) <= 1000){
    y_max <- ceiling(max(full_cases$cases)/100)*100
    y_min <- floor(min(full_cases$cases)/100)*100
    y_step <- 100
  } else if (max(full_cases$cases) <= 10000){
    y_max <- ceiling(max(full_cases$cases)/1000)*1000
    y_min <- floor(min(full_cases$cases)/1000)*1000
    y_step <- 1000
  } else if (max(full_cases$cases) <= 100000){
    y_max <- ceiling(max(full_cases$cases)/10000)*10000
    y_min <- floor(min(full_cases$cases)/10000)*10000
    y_step <- 5000
  } else {
    y_max <- ceiling(max(full_cases$cases)/100000)*100000
    y_min <- floor(min(full_cases$cases)/100000)*100000
    y_step <- 100000
  }
  
  if (max(full_new_cases$cases_1w_avg) <= 1000){
    yy_max <- ceiling(max(full_new_cases$cases_1w_avg)/100)*100
    yy_min <- floor(min(full_new_cases$cases_1w_avg)/100)*100
    yy_step <- 100
  } else if (max(full_new_cases$cases_1w_avg) <= 10000){
    yy_max <- ceiling(max(full_new_cases$cases_1w_avg)/1000)*1000
    yy_min <- floor(min(full_new_cases$cases_1w_avg)/1000)*1000
    yy_step <- 1000
  } else {
    yy_max <- ceiling(max(full_new_cases$cases_1w_avg)/10000)*10000
    yy_min <- floor(min(full_new_cases$cases_1w_avg)/10000)*10000
    yy_step <- 5000
  }
  
  plot(full_new_cases$date, full_new_cases$cases_1w_avg, ylim = c(yy_min, yy_max), xlab = NA, 
       ylab = NA,
       type='l',col="blue",lty = 4, pch = 3, font.lab = 3, bty = "l",
       xaxt = "n" ,yaxt = "n", lwd = 3, xaxs = "i", yaxs = "i", cex.lab = 1,
       main = this_state, cex.main = 2)
  lines(old_new_cases$date, old_new_cases$cases_1w_avg, type='l',col="blue",lty = 1, pch = 3, 
        font.lab = 3, bty = "l", lwd = 3)
  lines(c(current_day,current_day), c(yy_min, yy_max), type = 'l', col="grey", lty = 3, lwd = 3)
  axis.Date(1, at=x_time, format = "%m/%d", cex.axis = 1)
  axis(2, seq(yy_min, yy_max, yy_step), seq(yy_min, yy_max, yy_step), 
       las = 1, cex.axis = 1, options(scipen = 200))
  mtext(side = 1, line = 3, "Date", cex = 1.6)
  mtext(side = 2, line = 4, "7-day average daily cases", cex = 1.6)
  
  par(new=TRUE)
  plot(full_cases$date, full_cases$cases, ylim = c(y_min, y_max), xlab = NA, ylab = NA,
       type='l',col="red",lty = 4, pch = 3, font.lab = 3, bty = "l",
       xaxt = "n" ,yaxt = "n", lwd = 3, xaxs = "i", yaxs = "i", cex.lab = 1)
  lines(old_cases$date, old_cases$cases, type='l',col="red",lty = 1, pch = 3, font.lab = 3, 
        bty = "l",lwd = 3)
  axis(4, seq(y_min, y_max, y_step), seq(y_min, y_max, y_step), 
       las = 1, cex.axis = 1, options(scipen = 200))
  mtext(side = 4, line = 5, "Cumulative cases", cex = 1.6)
  
  dev.off()
}






















