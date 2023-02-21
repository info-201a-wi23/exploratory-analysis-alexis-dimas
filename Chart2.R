library(dplyr)
library(ggplot2)
library(plotly)
tinder <-read.csv("Tinder Millennial Match Rate Dataset.csv", stringsAsFactors = FALSE)
tinder <- read.csv("https://raw.githubusercontent.com/info-201a-wi23/exploratory-analysis-alexis-dimas/main/Tinder%20Millennial%20Match%20Rate%20Dataset.csv", stringsAsFactors = FALSE)
tinderydf<- tinder %>%
  group_by(Answer) %>%
  filter(It.became.a.Relationship == 'Yes') %>% 
  mutate(choice_counts = 1) %>% 
  summarize(count = sum(choice_counts)) %>% 
  mutate(outcome = 'Yes')

tinderndf<- tinder %>%
  group_by(Answer) %>%
  filter(It.became.a.Relationship == 'No') %>% 
  mutate(choice_counts = 1) %>% 
  summarize(count = sum(choice_counts)) %>% 
  mutate(outcome = 'No')


tinder_groups <- c(tinderydf$Answer, tinderndf$Answer)
Relationship <- c(tinderydf$outcome, tinderndf$outcome)
Users <- c(tinderydf$count, tinderndf$count)
tinderdf <- data.frame(tinder_groups, outcome, count)

ggplot(
  tinderdf, 
  aes(x = Relationship, y = Users, fill = tinder_groups)) + 
  geom_bar( stat = 'identity') + 
  labs(title = 'Relationship success based on usage of Tinder')
