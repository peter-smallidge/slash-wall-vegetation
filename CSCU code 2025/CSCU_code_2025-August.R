library(readxl)
veg_data <- read_excel("veg_data_2019to2024_complete(31july2025)(readme).xlsx")
View(veg_data)
#each row is a species at a plot, either clump/singles. 
table(veg_data$harvest, veg_data$wall)
# wall 99 means the only wall at that site, control, protected. 
table(veg_data$trmt, veg_data$wall)

table(veg_data$harvest, veg_data$brush)

table(veg_data$brush)


table(veg_data$brush, veg_data$trmt)
#brushed and unbrushed only exist in 6/6 and 6/9
#subset out only brushed for the first anlaysis. 


#upperexposed is the response variables (density = stems/acre)


library(ggplot2)
library(dplyr)


veg_data %>%
  filter(!harvest %in% c("6_6", "6_9", "decker", "recknagel_north"))%>%
  ggplot(aes(y=upperexposed, x = trmt, color=type ))+
  geom_point()+
  facet_wrap(~spp)

#diversity and interfere species are of more interest than commerical. 


#a good graph: 
veg_data %>%
  filter(!harvest %in% c("6_6", "6_9"))%>%
ggplot(aes(y=upperexposed, x = growingseasons, color=type ))+
  geom_jitter(height=0, width=0.2)+
  facet_grid(type~trmt)

#observe higher upperexposed in protected group. 
#also from literature, define a "success" threshold which says number of stems where you declare "success"- at what year do we achieve that? 


agg_data <- veg_data%>%
  group_by(season, harvest, wall, point, growingseasons, trmt,  type )%>%
  summarize(total_upperexposed= sum(upperexposed)) 


agg_data %>%
  filter(!harvest %in% c("6_6", "6_9"))%>%
  ggplot(aes(y=total_upperexposed, x = growingseasons, color=type ))+
  geom_jitter(height=0, width=0.2)+
  facet_grid(type~trmt)


library(lme4)
mod <- glmer(total_upperexposed ~ growingseasons * type * trmt + (1 | harvest/ wall/ point), data=agg_data, family="poisson")

summary(mod)



