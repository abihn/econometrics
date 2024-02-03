#load libs
library(tidyverse)

#1

#get data
data(mtcars)
df = mtcars #rename dataset

#a
df %>% 
  arrange(desc(mpg))
#Toyota Corolla, Fiat 128, Honda Civic, Lotus Europa, Fiat X1-9

#b
df %>%
  arrange(disp)
#Toyota Corolla, Honda Civic, Fiat 128, Fiat X1-9, Lotus Europa

#c
df = df %>%
  mutate(mpg_per_hp = mpg/hp)

mean(df$mpg_per_hp) #0.19
sd(df$mpg_per_hp) #0.14

#d
df %>%
  group_by(cyl) %>%
  summarise(avg_hp = mean(hp))

#e
df %>%
  ggplot(aes(x = mpg)) + 
  geom_histogram(bins = 20) +
  geom_vline(aes(xintercept = mean(mpg)), col = 'blue') +
  geom_vline(aes(xintercept = median(mpg)), col = 'red') +
  theme_bw()

#The distribution is skewed to the right because the mean is greater than the 
#median.
  




