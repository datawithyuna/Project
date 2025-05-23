library(ggplot2)
library(dplyr)
library('dplyr')
library('readr')

mydata <- Tweets


mydata %>%
  filter(!is.na(negativereason)) %>% 
  ggplot(aes(x = negativereason, # filter on non-missing values
             fill = negativereason)) + 
  geom_bar() + theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))


# Data transformation
mydata <- mydata %>% 
  group_by(airline) %>% # Variable to be transformed
  count() %>% 
  ungroup() %>% 
  mutate(perc = `n` / sum(`n`)) %>% 
  arrange(perc) %>%
  mutate(labels = scales::percent(perc))

ggplot(mydata, aes(x = "", y = perc, fill = airline)) +
  geom_col() +
  coord_polar(theta = "y")

ggplot(mydata, aes(x = "", y = airline, fill = airline)) + 
  geom_bar(stat="identity", width=1) + coord_polar("y", start=0) + 
  theme(axis.text.x=element_blank(), #remove x axis labels
        axis.ticks.x=element_blank(), #remove x axis ticks
        axis.text.y=element_blank(),  #remove y axis labels
        axis.ticks.y=element_blank()  #remove y axis ticks
        )


########## (below code didn't run in this script, but did run in other script)
newdata <- 
  mydata %>% 
  mutate(user_timezone = 
           as_factor(user_timezone))

class(newdata$user_timezone)

levels(newdata$user_timezone)

table(newdata$user_timezone)

newdata <- 
  newdata %>% 
  # only keep top 4 levels as explicit
  mutate(timezone_simple = 
           fct_lump_n(user_timezone, n = 5))

table(newdata$timezone_simple)
# Eastern Time (US & Canada) Pacific Time (US & Canada) Central Time (US & Canada) 
# 3744                       1208                       1931 
# Atlantic Time (Canada)                      Quito                      Other 
# 497                        738                       1702 


############