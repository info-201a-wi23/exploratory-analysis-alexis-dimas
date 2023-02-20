# Alexis Chart

library("ggplot2")
library("dplyr")
tinder_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-alexis-dimas/main/Tinder%20Millennial%20Match%20Rate%20Dataset.csv", stringsAsFactors = FALSE)

# How successful were college students in forming a relationship on Tinder?

university_df <- tinder_data %>% filter(Segment.Type == "University")
matched_df <- university_df %>% 
  filter(Answer == "Yes")

non_matched_df <- university_df %>% 
  filter(Answer == "No")

num_matches <- matched_df %>% 
  summarize(Matches = sum(matched_df$Count, na.rm = TRUE)) %>% pull(Matches)
num_non_matches <- non_matched_df %>% 
  summarize(Non_matches = sum(non_matched_df$Count, na.rm = TRUE)) %>% 
  pull(Non_matches)
relationship_sucess <- university_df %>% 
  filter(Answer == "I don't use Tinder") %>% 
  filter(It.became.a.Relationship == "Yes") %>% nrow()

names <- c("Formed Relationship", "Matched", "Did Not Match")

data <- data.frame(
  count = c(relationship_sucess, num_matches, num_non_matches),
  name = factor(names, levels = names),
  y = seq(length(names)) * 0.9
)

ggplot(data) + 
  geom_col(aes(count, name), fill = "BLUE", width = 0.6)
