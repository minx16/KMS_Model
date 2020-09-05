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
  this_state$date <- seq(as.Date("2020-01-22"), as.Date("2020-08-27"), 1)
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
seed = 12345
predict_periods <- seq(1,20,1)
num_centers_list <- c( 530, 370, 370, 370, 335, 635, 320, 370, 370, 370, 370, 375, 375, 370, 375, 375,
                       375, 375, 315, 315, 325, 330, 325, 330, 330, 330, 330, 330, 330, 330)

amape <- 0
mape <- 0

for (k in 1:length(predict_periods)){
  print(k)
  end_day <- as.Date("2020-08-26") - predict_periods[k]  
  begin_day <- end_day - 29    
  testing_day_list <- seq(begin_day, end_day, 1)
  num_centers_opt <- num_centers_list[k]

#Algorithm
test_error <- list()
for (j in 1:length(testing_day_list)){
  print(j)
  current_day <- testing_day_list[j]
  
  clustering_features <- state_covid_data %>%
    filter(date <= current_day) %>%
    select(-date, -state, -fips)
  clustering_features <- as.data.frame(scale(clustering_features))
  
  set.seed(seed)
  Kmeans_model <- kmeans(clustering_features, centers = num_centers_opt, algorithm="Lloyd", iter.max = 1000)
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
      filter(date <= current_day - predict_periods[k]) 
    trajectory_data <- historical_data
    
    for (t in 1:predict_periods[k]){
      trajectory <- historical_data %>%
        mutate(date = date + t) %>%
        left_join(clusters_data,
                  by = c("fips", "date")) %>%
        select(-cluster)
      trajectory_data <- trajectory_data %>%
        mutate(date = date + 1) %>%
        left_join(trajectory,
                  by = c("fips", "date"))
    }
    
    if (nrow(trajectory_data) == 0){
      covid_predict$cases_predict[n] <- mean(this_cluster_data$new_cases)*predict_periods[k]
    } else {
      new_cases_weekly <- apply(as.data.frame(trajectory_data[,-(1:2)]), 1, sum)
      covid_predict$cases_predict[n] <- min(mean(new_cases_weekly), 
                                            max(this_state_data$new_cases)*predict_periods[k])
    }
  }
  
  covid_actual <- state_covid_data %>%
    mutate(date = as.Date(date)) %>%
    filter(date >= current_day + 1) %>%
    filter(date <= current_day + predict_periods[k]) %>%
    select(fips, state, date, new_cases) %>%
    group_by(fips) %>%
    summarise_if(is.numeric, sum) %>%
    mutate(date = current_day)
  
  covid_predict_error <- covid_predict %>%
    left_join(covid_actual,
              by = c("fips" = "fips")) 

  test_error[[j]] <- covid_predict_error
}

#Bind table
predict_errors <- bind_rows(test_error) %>%
  left_join(census_in_states,
            by = "fips") %>%
  mutate(cases_predict = cases_predict*population/1000000) %>%
  mutate(new_cases = new_cases*population/1000000) %>%
  select(fips, date, new_cases, cases_predict) %>%
  filter(new_cases != 0) %>%
  mutate(ape = abs((cases_predict - new_cases)/new_cases)) %>%
  group_by(date) %>%
  summarise_if(is.numeric, sum) %>%
  mutate(ape = ape/51) %>%
  mutate(ape_national = abs((cases_predict - new_cases)/new_cases)) 

amape[k] <- mean(predict_errors$ape)
mape[k] <- mean(predict_errors$ape_national)
}










