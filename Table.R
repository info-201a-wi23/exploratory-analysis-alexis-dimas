library("dplyr")

# Load Tinder Data
tinder_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-alexis-dimas/main/Tinder%20Millennial%20Match%20Rate%20Dataset.csv", stringsAsFactors = FALSE)

#tinder_df <- read.csv("Tinder millennial Match Rate dataset.csv", stringsAsFactors = FALSE)

gender_df <- tinder_data %>% filter(Segment.Type == "Gender")
