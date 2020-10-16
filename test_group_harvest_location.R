library(tidyverse)

plot.data = read_csv("~/R/slash-wall-vegetation/plot-data-2019.csv")

head(plot.data)

site <- plot.data %>% 
  filter(location =="interior" | location=="control") %>% 
  select(harvest, location, ba) %>% 
  group_by(harvest, location) %>% 
  summarize(basal_area = mean(ba))

site  

plot.data %>% 
  arrange(harvest, location) %>% 
  group_by(harvest,location) %>% 
  skim()
