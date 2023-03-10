library("dplyr")
library("kableExtra")

# Load Tinder Data
tinder_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-alexis-dimas/main/Tinder%20Millennial%20Match%20Rate%20Dataset.csv", stringsAsFactors = FALSE)

gender_df <- tinder_data %>% 
  group_by(Segment.Type) %>% 
  filter(Segment.Type == "Gender")

gender_df %>% 
  kbl() %>% 
  kable_styling() %>% 
  kable_paper("hover", full_width = F)
