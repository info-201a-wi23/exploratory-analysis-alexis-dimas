library("dplyr")

# Load Tinder Data
tinder_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-alexis-dimas/main/Tinder%20Millennial%20Match%20Rate%20Dataset.csv", stringsAsFactors = FALSE)

tinder_df <- read.csv("Tinder millennial Match Rate dataset.csv", stringsAsFactors = FALSE)


gender <- trimws(gender)
length(gender[gender == 'male respondents'])

length(gender[gender == 'female respondents'])

avg_percentage <- tinder_df %>% 
  group_by(Percentage) %>%  
  summarize(avg_percentage = mean(PercentageofRelationships))