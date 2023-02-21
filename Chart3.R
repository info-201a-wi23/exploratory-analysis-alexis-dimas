# Alexis Chart3.R
# The number of males and females that have matched and not matched on Tinder.

# Load libraries
library("ggplot2")
library("dplyr")

# Load Tinder Data
tinder_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-alexis-dimas/main/Tinder%20Millennial%20Match%20Rate%20Dataset.csv", stringsAsFactors = FALSE)

# Creates a data frame that has the gender of those that were surveyed
user_df <- tinder_data %>% filter(Segment.Type == "Gender") %>% filter(Answer != "I don't use Tinder")

# Creates data frame for bar chart
labels <- c("Male Matched", "Male No Match", "Female Matched", "Female No Match")
data <- data.frame(
  Group = factor(labels, levels = labels),
  Value = c(user_df$Count)
)

# Creates a pie chart
ggplot(data, aes(x = "", y = Value, fill = Group)) + 
  geom_bar(width = NULL, stat = "identity") + 
  coord_polar(theta = "y", start = 0) + 
  labs(title = 'Number of Tinder matches across users') + 
  geom_label(aes(label = Value), position = position_stack(vjust = 0.5),
             show.legend = FALSE) + 
  theme_void()