rm(list=ls())
library(tidyverse)
library(geosphere)
library(readxl)
library(rgeos)
library(zoo)
library(sp)
library(rlist)
library(LICORS)


## State level cases

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


## Training 

seed = 12345
predict_periods <- seq(7, 7, 1)
num_centers_list <- seq(1, 1000, 1)

min_training_mape <- 0
num_centers_opt <- 0
for (k in 1:length(predict_periods)){
  print(k)
  
  #Parameters
  end_day <- as.Date("2020-06-30")
  begin_day <- as.Date("2020-06-01")
  training_day_list <- seq(begin_day, end_day, 1)
  
  #Algorithm
  MAPE <- list()
  for (i in 1:length(num_centers_list)){
    print(i)
    num_centers <- num_centers_list[i]
    
    day_MAPE <- data.frame(num_centers = numeric(length(training_day_list)),
                           current_day = as.Date(length(training_day_list)),
                           num_states = numeric(length(training_day_list)),
                           mape = numeric(length(training_day_list)),
                           stringsAsFactors = FALSE)
    day_MAPE$num_centers <- num_centers
    
    for (j in 1:length(training_day_list)){
      print(j)
      current_day <- training_day_list[j]
      
      clustering_features <- state_covid_data %>%
        filter(date <= current_day) %>%
        select(-date, -state, -fips)
      clustering_features <- as.data.frame(scale(clustering_features))
      
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
            new_cases_weekly <- apply(trajectory_data[,-(1:2)], 1, sum)
            covid_predict$cases_predict[n] <- min(mean(new_cases_weekly), 
                                                  max(this_state_data$new_cases)*predict_periods[k])
          }
        }
  
        covid_actual <- state_covid_data %>%
          mutate(date = as.Date(date)) %>%
          filter(date >= current_day + 1) %>%
          filter(date <= current_day + predict_periods[k]) %>%
          select(fips, new_cases) %>%
          group_by(fips) %>%
          summarise_if(is.numeric, sum)
        
        covid_predict_error <- covid_predict %>%
          left_join(covid_actual,
                    by = c("fips" = "fips")) %>%
          mutate(cases_error_percent = abs((cases_predict - new_cases)/new_cases)) %>%
          filter(!is.infinite(cases_error_percent)) %>%
          mutate(cases_error_percent = replace(cases_error_percent, is.na(cases_error_percent), 0)) #0/0
        
        day_MAPE$current_day[j] <- current_day
        day_MAPE$num_states[j] <- nrow(covid_predict_error)
        day_MAPE$mape[j] <- mean(covid_predict_error$cases_error_percent)
      }

    MAPE[[i]] <- day_MAPE
    
  }
  error_training <- bind_rows(MAPE) %>%
    group_by(num_centers) %>%
    summarise_if(is.numeric, mean)
  min_training_mape[k] <- min(error_training$mape)
  num_centers_opt[k] <- error_training$num_centers[which.min(error_training$mape)]
}




## Testing

#Parameters
predict_periods <- 7

for (k in 1:length(predict_periods)){
  print(k)
  end_day <-  as.Date("2020-07-30")  
  begin_day <- as.Date("2020-07-10") 
  testing_day_list <- seq(begin_day, end_day, 1)
  num_centers_opt <- num_centers_opt[1]

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


##Comparison

#IHME
test_error_IHME <- list()
for (j in 1:length(testing_day_list)){
  print(j)
  current_day <- testing_day_list[j]

  if (current_day <= as.Date("2020-07-11")){
    file_ihme <- "download data/HIME/2020_07_04"
  } else if (current_day <= as.Date("2020-07-18")){
    file_ihme <- "download data/HIME/2020_07_11"
  } else if (current_day <= as.Date("2020-07-26")){
    file_ihme <- "download data/HIME/2020_07_18"
  } else {
    file_ihme <- "download data/HIME/2020_07_26"
  }

  setwd(file_ihme)
  IHME <- read.csv("Reference_hospitalization_all_locs.csv", header = T, stringsAsFactors = FALSE, sep = ",") %>%
    select(location_name, date, est_infections_mean) %>%
    transmute(state = as.character(location_name),
              date = as.Date(date),
              cases_predict_ihme = as.numeric(est_infections_mean))

  IHME_state <- state_covid %>%
    select(fips, state, date) %>%
    left_join(IHME,
              by = c("state", "date"))

  covid_predict_IHME <- IHME_state %>%
    filter(date >= current_day + 1) %>%
    filter(date <= current_day + predict_periods[k]) %>%
    group_by(fips) %>%
    summarise_if(is.numeric, sum) %>%
    mutate(date = current_day)

  test_error_IHME[[j]] <- covid_predict_IHME
}

#Los Alamos
state_fips <- state_covid %>%
  filter(date == current_day) %>%
  select(state, fips)

setwd("download data")
test_error_alamos <- list()
for (j in 1:length(testing_day_list)){
  print(j)
  current_day <- testing_day_list[j]
  
  if (current_day <= as.Date("2020-07-12")){
    file_LosAlamos <- "2020-07-08_LosAlamos.csv"
  } else if (current_day <= as.Date("2020-07-15")){
    file_LosAlamos <- "2020-07-12_LosAlamos.csv"
  } else if (current_day <= as.Date("2020-07-19")){
    file_LosAlamos <- "2020-07-15_LosAlamos.csv"
  } else if (current_day <= as.Date("2020-07-22")){
    file_LosAlamos <- "2020-07-19_LosAlamos.csv"
  } else if (current_day <= as.Date("2020-07-26")){
    file_LosAlamos <- "2020-07-22_LosAlamos.csv"
  } else if (current_day <= as.Date("2020-07-29")){
    file_LosAlamos <- "2020-07-26_LosAlamos.csv"
  } else {
    file_LosAlamos <- "2020-07-29_LosAlamos.csv"
  }
  
  covid_alamos <- read.csv(file_LosAlamos, header = T, stringsAsFactors = FALSE, sep = ",") %>%
    select(state, dates, q.50) %>%
    transmute(state = as.character(state),
              date = as.Date(dates),
              cases = as.numeric(q.50)) %>%
    left_join(state_fips,
              by = "state") %>%
    select(fips, date, cases)
  
  covid_current_alamos <- covid_alamos %>%
    filter(date == current_day)
  covid_predict_alamos <- covid_alamos %>%
    filter(date == current_day + predict_periods[k]) %>%
    select(-date) %>%
    left_join(covid_current_alamos,
              by = "fips") %>%
    mutate(cases_predict_alamos = cases.x - cases.y) %>%
    select(fips, date, cases_predict_alamos)
  
  test_error_alamos[[j]] <- covid_predict_alamos
}

#Shaman group, Columbia university
test_error_Shaman <- list()
for (j in 1:length(testing_day_list)){
  print(j)
  current_day <- testing_day_list[j]

  if (current_day <= as.Date("2020-07-12")){
    shaman_url <- "https://raw.githubusercontent.com/shaman-lab/COVID-19Projection/master/Projection_July9/Projection_nochange.csv"
  } else if (current_day <= as.Date("2020-07-16")){
    shaman_url <- "https://raw.githubusercontent.com/shaman-lab/COVID-19Projection/master/Projection_July12/Projection_nochange.csv"
  } else if (current_day <= as.Date("2020-07-19")){
    shaman_url <- "https://raw.githubusercontent.com/shaman-lab/COVID-19Projection/master/Projection_July16/Projection_nochange.csv"
  } else if (current_day <= as.Date("2020-07-26")){
    shaman_url <- "https://raw.githubusercontent.com/shaman-lab/COVID-19Projection/master/Projection_July19/Projection_nochange.csv"
  } else {
    shaman_url <- "https://raw.githubusercontent.com/shaman-lab/COVID-19Projection/master/Projection_July26/Projection_nochange.csv"
  }

  covid_shaman <- read_csv(shaman_url, col_types = "cccnnnnnnnnnn") %>%
    select(fips, Date, report_50) %>%
    mutate(fips = substr(fips, 1, 2)) %>%
    transmute(fips = as.character(fips),
              date = as.Date(Date, "%m/%d/%y"),
              cases_predict_shaman = as.numeric(report_50)) %>%
    group_by(fips, date) %>%
    summarize_if(is.numeric, sum)

  covid_predict_Shaman <- covid_shaman %>%
    filter(date >= current_day + 1)%>%
    filter(date <= current_day + predict_periods[k]) %>%
    group_by(fips) %>%
    summarise_if(is.numeric, sum) %>%
    mutate(date = current_day)

  test_error_Shaman[[j]] <- covid_predict_Shaman
}

#Baseline
test_error_baseline <- list()
for (j in 1:length(testing_day_list)){
  print(j)
  current_day <- testing_day_list[j]
  
  covid_predict_baseline <- state_covid_data %>%
    mutate(date = as.Date(date)) %>%
    left_join(census_in_states,
              by = "fips") %>%
    mutate(new_cases = new_cases*population/1000000) %>%
    filter(date == current_day) %>%
    select(fips, date, new_cases) %>%
    mutate(cases_predict_baseline = new_cases*predict_periods[k]) %>%
    select(-new_cases)
  
  test_error_baseline[[j]] <- covid_predict_baseline
}


#Bind table
predict_errors <- bind_rows(test_error) %>%
  left_join(census_in_states,
            by = "fips") %>%
  mutate(cases_predict = cases_predict*population/1000000) %>%
  mutate(new_cases = new_cases*population/1000000) %>%
  select(fips, date, new_cases, cases_predict) %>%
  left_join(bind_rows(test_error_IHME),
            by = c("fips", "date")) %>%
  left_join(bind_rows(test_error_baseline),
            by = c("fips", "date")) %>%
  left_join(bind_rows(test_error_Shaman),
            by = c("fips", "date")) %>%
  left_join(bind_rows(test_error_alamos),
            by = c("fips", "date")) %>%
  filter(new_cases != 0) %>%
  filter(is.na(cases_predict_ihme) == FALSE ) %>%
  mutate(ape = abs((cases_predict - new_cases)/new_cases)) %>%
  mutate(ape_IHME = abs((cases_predict_ihme - new_cases)/new_cases)) %>%
  mutate(ape_baseline = abs((cases_predict_baseline - new_cases)/new_cases)) %>%
  mutate(ape_shaman = abs((cases_predict_shaman - new_cases)/new_cases)) %>%
  mutate(ape_alamos = abs((cases_predict_alamos - new_cases)/new_cases)) %>%
  group_by(date) %>%
  summarise_if(is.numeric, sum) %>%
  mutate(ape = ape/51) %>%
  mutate(ape_IHME = ape_IHME/51) %>%
  mutate(ape_baseline = ape_baseline/51) %>%
  mutate(ape_shaman = ape_shaman/51) %>%
  mutate(ape_alamos = ape_alamos/51) %>%
  mutate(ape_national = (cases_predict - new_cases)/new_cases) %>%
  mutate(ape_IHME_national = (cases_predict_ihme - new_cases)/new_cases) %>%
  mutate(ape_baseline_national = (cases_predict_baseline - new_cases)/new_cases) %>%
  mutate(ape_shaman_national = (cases_predict_shaman - new_cases)/new_cases) %>%
  mutate(ape_alamos_national = (cases_predict_alamos - new_cases)/new_cases)

}











