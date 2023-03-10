library("dplyr")
library("tidyverse")

tinder_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-alexis-dimas/main/Tinder%20Millennial%20Match%20Rate%20Dataset.csv", stringsAsFactors = FALSE)

#tinder_df <- read.csv("Tinder millennial Match Rate dataset.csv", stringsAsFactors = FALSE)


#People from Mobile

people_mobile <- tinder_data %>% 
  filter(Segment.Type == "Mobile") %>% 
  summarize(Count = sum(Count)) %>% 
  pull(Count)

#People from web
  
people_web <- tinder_data %>% 
  filter(Segment.Type == "Web") %>% 
  summarize(Count = sum(Count)) %>% 
  pull(Count)

#People from University 
  
people_University <- tinder_data %>% 
  filter(Segment.Type == "University") %>% 
  summarize(Count = sum(Count)) %>% 
  pull(Count)

#Number of females 
  
female_respondents <- tinder_data %>% 
  filter(agrepl("Female Respondents", Segment.Description)) %>% 
  summarize(Count = sum(Count)) %>% 
  pull(Count)

#Number of Male 
  
male_respondents <- tinder_data %>% 
  filter(agrepl("Male Respondents", Segment.Description)) %>% 
  summarize(Count = sum(Count)) %>% 
  pull(Count)
  
  