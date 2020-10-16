library(tidyverse)

plot.data = read_csv("~/R/slash-wall-vegetation/plot-data-2019.csv")

spec(plot.data)
dim(plot.data)

site <- plot.data %>% 
  dplyr::filter(location =="interior" | location=="control") %>% 
  dplyr::select(harvest, location, ba) %>% 
  dplyr::group_by(harvest, location) %>% 
  dplyr::summarize(basal_area = mean(ba))

site  

plot.data %>% 
  arrange(harvest, location) %>% 
  group_by(harvest,location) %>% 
  skim()
