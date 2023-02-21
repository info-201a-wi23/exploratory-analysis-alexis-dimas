# Alexis Chart1.R
# The number of matches that college students experienced on Twitter. And the number of successful relationships created.

# Load libraries
library("ggplot2")
library("dplyr")

# Load Tinder Data
tinder_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-alexis-dimas/main/Tinder%20Millennial%20Match%20Rate%20Dataset.csv", stringsAsFactors = FALSE)

# Creates a data frame of just the university responses, has a select number of universities from the U.S. and does not include all.
university_df <- tinder_data %>% filter(Segment.Type == "University")

# Creates a data frame of just college students who have successfully matched with someone on Tinder
matched_df <- university_df %>% 
  filter(Answer == "Yes")

# Creates a data frame of just college students who have unsuccessfully matched with someone on Tinder
non_matched_df <- university_df %>% 
  filter(Answer == "No")

# Pulls the number of matches
num_matches <- matched_df %>% 
  summarize(Matches = sum(matched_df$Count, na.rm = TRUE)) %>% pull(Matches)

# Pulls the number of unsuccessful matches
num_non_matches <- non_matched_df %>% 
  summarize(Non_matches = sum(non_matched_df$Count, na.rm = TRUE)) %>% 
  pull(Non_matches)

# Counts the number of sucessful 
relationship_sucess <- university_df %>% 
  filter(Answer == "Yes") %>% 
  filter(It.became.a.Relationship == "Yes") %>% nrow()

# Creates bar chart
# Removes axis titles, gray background, and border
blank_theme <- theme_bw() +
  theme(
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.border = element_blank(), # remove border around plot
  )

# Creates data frame for bar chart
names <- c("Formed Relationship", "Matched", "Did Not Match")
data <- data.frame(
  count = c(relationship_sucess, num_matches, num_non_matches),
  name = factor(names, levels = names)
)

Tinder_Color = "#FF5864"
ggplot(data, aes(x = count, y = name)) + 
  geom_col(aes(count, name), fill = Tinder_Color, width = 0.5) + 
  geom_text(aes(label = count), vjust = 0.5, hjust = -0.1) + blank_theme + 
  labs(title = 'Matches to Relationships Formed on Tinder')
