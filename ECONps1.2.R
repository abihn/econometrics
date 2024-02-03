#load libs
library(tidyverse)

#read data
df = read.csv("odp_idb_2001_2022_ddg_compliant.csv")

#remove aggregated observations
df = df %>%
  filter(County != "California")

#a
nrow(df)
#186,702

#b
n_distinct(df$County)
#58

#c
n_distinct(df$Disease)
#52

#d
df %>%
  filter(Sex == 'Total') %>%
  group_by(Year) %>%
  summarise(TOTAL = sum(Cases)) %>%
  arrange(desc(TOTAL))
#2019

#e
df %>%
  filter(Sex == 'Total') %>%
  group_by(Disease) %>%
  summarise(TOTAL = sum(Cases)) %>%
  arrange(desc(TOTAL))
#Campylobacteriosis

#f
df %>%
  filter(Sex == 'Total') %>% 
  group_by(County) %>%
  summarise(TOTAL = sum(Cases)) %>%
  arrange(desc(TOTAL))
#Los Angeles

#g
dfp = df %>%
  filter((Disease == 'Campylobacteriosis')) %>%
  filter(is.na(Cases) == F) %>%
  group_by(Year, Sex) %>%
  summarise(Total_Cases = sum(Cases))
  
dfp

p = ggplot(data = dfp, aes(x = Year, y = Total_Cases)) +
  geom_line(aes(color = Sex)) +
  labs(title = "Campylobacteriosis Cases over Time by Sex") +
  theme_bw()
p
#Men have more cases in every year. Trends between men and women follow the 
#same patterns over time. There was a general increase in cases of 
#Campylobacteriosis from around 2006 to 2019, followed by a sharp decline in
#2020. Cases then rebounded to their previous levels around 2022.
  
  