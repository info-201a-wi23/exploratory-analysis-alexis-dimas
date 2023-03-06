library("dplyr")
library("tidyverse")

tinder_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-alexis-dimas/main/Tinder%20Millennial%20Match%20Rate%20Dataset.csv", stringsAsFactors = FALSE)

#tinder_df <- read.csv("Tinder millennial Match Rate dataset.csv", stringsAsFactors = FALSE)


#People from Moblie

people_moblie <- tinder_data %>%
  filter(Segment.Type == "Mobile") %>%
  select(Segment.Description, Count) 

#People fro web
  
  people_web <- tinder_data %>%
    filter(Segment.Type == "Web") %>%
    select(Segment.Description, Count) 

#People from University 
  
  people_University <- tinder_data %>%
    filter(Segment.Type == "University") %>%
    select(Segment.Description, Count)

#Number of females 
  
  female_respondents <- tinder_data %>%
    filter(agrepl("Female Respondents", Segment.Description)) %>%
    select(Segment.Description, Count)

#Number of Male 
  
  male_respondents <- tinder_data %>%
    filter(agrepl("Male Respondents", Segment.Description)) %>%
    select(Segment.Description, Count)
  
  
  all.equal(gender_df$Segment.Description, "Female Respondents")
  