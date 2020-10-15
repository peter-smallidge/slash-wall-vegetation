Slash Wall Plot Analysis
================
Peter Smallidge
10/14/2020

<br>

# Read data files as csv located within the repository

# Conduct basic visualization of the data

## Use the function “skim” to provide summary statistics

``` r
setwd("~/R/slash-wall-vegetation")
input.data = read.table("plot-data-2019.csv", header = TRUE, sep = ",")
# str(input.data) displays the structure of the variables

plot.data <- input.data
#code below to convert character variables to factor variables. I don't think this is necessary.
#
  #select(harvest, location, low.spp, invasive.spp, mid.spp, upper.spp, vine.spp) %>% 
 # mutate_if(is.character,as.factor)

# These are redundant with the more thorough output of "skim"
#str(plot.data)
#glimpse(plot.data)
#names(plot.data)
#dim(plot.data)
skim(plot.data)
```

|                                                  |           |
| :----------------------------------------------- | :-------- |
| Name                                             | plot.data |
| Number of rows                                   | 248       |
| Number of columns                                | 28        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |           |
| Column type frequency:                           |           |
| character                                        | 17        |
| numeric                                          | 11        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |           |
| Group variables                                  | None      |

Data summary

**Variable type: character**

| skim\_variable | n\_missing | complete\_rate | min | max | empty | n\_unique | whitespace |
| :------------- | ---------: | -------------: | --: | --: | ----: | --------: | ---------: |
| harvest        |          0 |              1 |   1 |   4 |     0 |         7 |          0 |
| date           |          0 |              1 |  10 |  10 |     0 |        35 |          0 |
| location       |          0 |              1 |   7 |   9 |     0 |         3 |          0 |
| disturb        |          0 |              1 |   1 |   1 |     0 |         5 |          0 |
| slash          |          0 |              1 |   1 |   1 |     0 |         5 |          0 |
| fern           |          0 |              1 |   1 |   4 |     0 |         7 |          0 |
| herb           |          0 |              1 |   1 |   4 |     0 |         6 |          0 |
| low.cov        |          0 |              1 |   1 |   1 |     0 |         4 |          0 |
| low.spp        |          0 |              1 |   4 |   4 |     0 |         4 |          0 |
| invasive.cov   |          0 |              1 |   1 |   1 |     0 |         3 |          0 |
| invasive.spp   |          0 |              1 |   0 |   4 |   212 |         5 |          0 |
| mid.cov        |          0 |              1 |   1 |   1 |     0 |         5 |          0 |
| mid.spp        |          0 |              1 |   0 |   4 |    18 |        30 |          0 |
| upper.cov      |          0 |              1 |   0 |   2 |     1 |         7 |          0 |
| vine.cov       |          0 |              1 |   0 |   1 |     3 |         5 |          0 |
| vine.spp       |          0 |              1 |   0 |   4 |   188 |         5 |          0 |
| maple          |          0 |              1 |   0 |   2 |   137 |        11 |          0 |

**Variable type: numeric**

| skim\_variable | n\_missing | complete\_rate |    mean |     sd |   p0 |     p25 |    p50 |     p75 | p100 | hist  |
| :------------- | ---------: | -------------: | ------: | -----: | ---: | ------: | -----: | ------: | ---: | :---- |
| season         |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| plot           |          0 |           1.00 |  705.92 | 217.25 |  334 |  395.75 |  773.5 |  860.25 |  975 | ▆▁▁▇▆ |
| upper.spp      |         79 |           0.68 |  503.75 | 245.79 |  129 |  318.00 |  318.0 |  833.00 |  951 | ▁▇▁▁▅ |
| baf            |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| oakhick        |        178 |           0.28 |    2.04 |   1.16 |    1 |    1.00 |    2.0 |    3.00 |    5 | ▇▃▃▂▁ |
| beech          |        236 |           0.05 |    1.42 |   0.67 |    1 |    1.00 |    1.0 |    2.00 |    3 | ▇▁▃▁▁ |
| birch          |        242 |           0.02 |    1.00 |   0.00 |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| hdwd           |        233 |           0.06 |    1.20 |   0.41 |    1 |    1.00 |    1.0 |    1.00 |    2 | ▇▁▁▁▂ |
| conifer        |        237 |           0.04 |    1.36 |   0.67 |    1 |    1.00 |    1.0 |    1.50 |    3 | ▇▁▂▁▁ |
| ba             |          0 |           1.00 |   20.12 |  19.85 |    0 |    0.00 |   20.0 |   30.00 |  100 | ▇▂▂▁▁ |
| seedling.numb  |         80 |           0.68 |   24.79 |  29.96 |    0 |    1.00 |   10.0 |   43.25 |  100 | ▇▂▂▁▁ |

``` r
#skimr::skim_tee(plot.data) - same as previous line
table(plot.data$ba)
```

    ## 
    ##   0  10  20  30  40  50  60  70  80 100 
    ##  71  52  41  31  19  20   8   2   3   1

``` r
#the following does not work. Variable "maple" should be integer
#plot.data %>% 
#  mutate_at(vars(beech, maple, birch, hdwd,conifer),integer)

#the following does not work...note maple is "character"
#plot.data %>% 
#  cols(
#    maple=col_integer()
#  )

head(plot.data)
```

    ##   harvest season       date location plot disturb slash fern herb low.cov
    ## 1    Boot   2019 2020.06.16 interior  349       l     p    a    m       h
    ## 2    Boot   2019 2020.06.16 interior  350       m     p    m    l       h
    ## 3    Boot   2019 2020.06.17 interior  351       a     m    a    p       m
    ## 4    Boot   2019 2020.06.22 interior  352       m     m    l    p       h
    ## 5    Boot   2019 2020.06.17 interior  353       p     m    m    m       m
    ## 6    Boot   2019 2020.06.22 interior  354       p     h    l    p       h
    ##   low.spp invasive.cov invasive.spp mid.cov mid.spp upper.cov upper.spp
    ## 1    rubu            p         loni       p     761         l       318
    ## 2    rubu            a                    p     761         p       531
    ## 3    rubu            a                    m     531         m       531
    ## 4    rubu            a                    p     372         l       318
    ## 5    rubu            p         rosa       p     951         m       316
    ## 6    rubu            a                    p    samb         p       316
    ##   vine.cov vine.spp baf oakhick beech maple birch hdwd conifer ba seedling.numb
    ## 1        a           10      NA    NA     2    NA   NA      NA 20           100
    ## 2        a           10      NA     1          NA   NA      NA 10            50
    ## 3        a           10      NA     1     2    NA   NA      NA 30           100
    ## 4        a           10      NA    NA     3    NA   NA      NA 30           100
    ## 5        p     viti  10      NA    NA     5    NA    1      NA 60            25
    ## 6        p     viti  10      NA    NA     3    NA   NA      NA 30            10

``` r
#
```

<br>

\#Subset data, group by harvest x location

``` r
# Sort and group data by site (harvest name + interior vs. control)
# https://cmdlinetips.com/2020/08/dplyr-groupby-and-summarize-group-by-one-or-more-variables/ 
# 

site <- plot.data %>% 
  filter(location =="interior" | location=="control") %>% 
  select(harvest, location, ba) %>% 
  group_by(harvest, location) %>% 
  summarize(basal_area = mean(ba, na.rm = TRUE))

site
```

    ##   basal_area
    ## 1   23.50575

``` r
site_alt <- plot.data %>% 
   filter(!(location=="perimeter"))

#the equivalent filter result also comes from ...
  #filter(location =="interior" | location=="control")

site_alt %>% 
  group_by(harvest) %>% 
  summarize(basal_area=mean(ba))
```

    ##   basal_area
    ## 1   23.50575

``` r
#view(site_alt)

#write.table(site_alt, "site_BA_means.txt", sep="\t")
```

``` r
# site %>% 
# pivot_wider(names_from = location,
#             values_from = basal_area)
  
#view(ba_summ)

#site %>% 
#  select(harvest, location, basal_area) %>% 
#  table()
```

``` r
site <- plot.data %>% 
  filter(location =="interior" | location=="control") %>% 
  select(harvest, location, ba)

  head(site)
```

    ##   harvest location ba
    ## 1    Boot interior 20
    ## 2    Boot interior 10
    ## 3    Boot interior 30
    ## 4    Boot interior 30
    ## 5    Boot interior 60
    ## 6    Boot interior 30

``` r
site <- plot.data %>% 
  filter(location =="interior" | location=="control") %>% 
  select(harvest, location, ba) %>% 
  group_by(harvest, location)

head(site, n=20)
```

    ## # A tibble: 20 x 3
    ## # Groups:   harvest, location [1]
    ##    harvest location    ba
    ##    <chr>   <chr>    <int>
    ##  1 Boot    interior    20
    ##  2 Boot    interior    10
    ##  3 Boot    interior    30
    ##  4 Boot    interior    30
    ##  5 Boot    interior    60
    ##  6 Boot    interior    30
    ##  7 Boot    interior     0
    ##  8 Boot    interior    40
    ##  9 Boot    interior    30
    ## 10 Boot    interior    20
    ## 11 Boot    interior    40
    ## 12 Boot    interior    60
    ## 13 Boot    interior    50
    ## 14 Boot    interior    20
    ## 15 Boot    interior    20
    ## 16 Boot    interior    40
    ## 17 Boot    interior    40
    ## 18 Boot    interior    50
    ## 19 Boot    interior    50
    ## 20 Boot    interior    60

``` r
site <- plot.data %>% 
  filter(location =="interior" | location=="control") %>% 
  select(harvest, location, ba) %>% 
  group_by(harvest, location) %>% 
  summarize(basal_area = mean(ba, na.rm = TRUE))

site
```

    ##   basal_area
    ## 1   23.50575
