Slash Wall Plot Analysis
================
Peter Smallidge
10/14/2020

<br>

## Read data files as csv located within the repository

## Conduct basic visualization of the data

## Use the function “skim” to provide summary statistics

``` r
setwd("~/R/slash-wall-vegetation")
input.data = read.table("plot-data-2019.csv", header = TRUE, sep = ",")
plot.data <- input.data

# str(input.data) displays the structure of the variables
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
| harvest        |          0 |              1 |   2 |   5 |     0 |         7 |          0 |
| date           |          0 |              1 |  10 |  10 |     0 |        35 |          0 |
| location       |          0 |              1 |   7 |   9 |     0 |         3 |          0 |
| disturb        |          0 |              1 |   1 |   1 |     0 |         5 |          0 |
| slash          |          0 |              1 |   1 |   1 |     0 |         5 |          0 |
| fern           |          0 |              1 |   0 |   1 |     8 |         7 |          0 |
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
| point          |          0 |           1.00 |  705.92 | 217.25 |  334 |  395.75 |  773.5 |  860.25 |  975 | ▆▁▁▇▆ |
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
table(plot.data$ba)
```

    ## 
    ##   0  10  20  30  40  50  60  70  80 100 
    ##  71  52  41  31  19  20   8   2   3   1

``` r
head(plot.data, n=10)
```

    ##    harvest season       date location point disturb slash fern herb low.cov
    ## 1     boot   2019 2020.06.16 interior   349       l     p    a    m       h
    ## 2     boot   2019 2020.06.16 interior   350       m     p    m    l       h
    ## 3     boot   2019 2020.06.17 interior   351       a     m    a    p       m
    ## 4     boot   2019 2020.06.22 interior   352       m     m    l    p       h
    ## 5     boot   2019 2020.06.17 interior   353       p     m    m    m       m
    ## 6     boot   2019 2020.06.22 interior   354       p     h    l    p       h
    ## 7     boot   2019 2020.06.16 interior   355       p     p    a    p       h
    ## 8     boot   2019 2020.06.19 interior   356       l     h    p    p       h
    ## 9     boot   2019 2020.06.22 interior   357       a     h    h    p       m
    ## 10    boot   2019 2020.06.19 interior   358       l     m    p    p       h
    ##    low.spp invasive.cov invasive.spp mid.cov mid.spp upper.cov upper.spp
    ## 1     rubu            p         loni       p     761         l       318
    ## 2     rubu            a                    p     761         p       531
    ## 3     rubu            a                    m     531         m       531
    ## 4     rubu            a                    p     372         l       318
    ## 5     rubu            p         rosa       p     951         m       316
    ## 6     rubu            a                    p    samb         p       316
    ## 7     rubu            a                    m     761         a        NA
    ## 8     rubu            a                    p     761         m       316
    ## 9     rubu            a                    l     761         a        NA
    ## 10    samb            a                    p     761         p       316
    ##    vine.cov vine.spp baf oakhick beech maple birch hdwd conifer ba
    ## 1         a           10      NA    NA     2    NA   NA      NA 20
    ## 2         a           10      NA     1          NA   NA      NA 10
    ## 3         a           10      NA     1     2    NA   NA      NA 30
    ## 4         a           10      NA    NA     3    NA   NA      NA 30
    ## 5         p     viti  10      NA    NA     5    NA    1      NA 60
    ## 6         p     viti  10      NA    NA     3    NA   NA      NA 30
    ## 7         a           10      NA    NA          NA   NA      NA  0
    ## 8         a           10      NA    NA     4    NA   NA      NA 40
    ## 9         p     viti  10      NA    NA     3    NA   NA      NA 30
    ## 10        p     viti  10      NA    NA     2    NA   NA      NA 20
    ##    seedling.numb
    ## 1            100
    ## 2             50
    ## 3            100
    ## 4            100
    ## 5             25
    ## 6             10
    ## 7            100
    ## 8             10
    ## 9              0
    ## 10            10

``` r
tail(plot.data, n=10)
```

    ##     harvest season       date  location point disturb slash fern herb low.cov
    ## 239   wedge   2019 2020.06.23 perimeter   966       a     p    p    l       m
    ## 240   wedge   2019 2020.06.23 perimeter   967       p     p    p    l       h
    ## 241   wedge   2019 2020.06.23 perimeter   968       p     m    l    l       h
    ## 242   wedge   2019 2020.06.25 perimeter   969       l     l    l    l       h
    ## 243   wedge   2019 2020.06.25 perimeter   970       m     l    l    h       m
    ## 244   wedge   2019 2020.06.25 perimeter   971       m     l    l    m       m
    ## 245   wedge   2019 2020.06.25 perimeter   972       p     l    p    m       h
    ## 246   wedge   2019 2020.06.29 perimeter   973       l     l    p    h       m
    ## 247   wedge   2019 2020.06.29 perimeter   974       l     p    p    h       p
    ## 248   wedge   2019 2020.06.23 perimeter   975       m     l    p    m       l
    ##     low.spp invasive.cov invasive.spp mid.cov mid.spp upper.cov upper.spp
    ## 239    rubu            a                    h     761         p       316
    ## 240    rubu            a                    m     761         p       318
    ## 241    rubu            a                    l     761         l       316
    ## 242    rubu            a                    m     761         p       318
    ## 243    rubu            a                    m     761         m       318
    ## 244    rubu            a                    h    samb         l       316
    ## 245    rubu            a                    m     761         p       318
    ## 246    rubu            a                    m     743         p       316
    ## 247    rubu            a                    m     743         m       316
    ## 248    rubu            a                    m     743         m       316
    ##     vine.cov vine.spp baf oakhick beech maple birch hdwd conifer ba
    ## 239        p     viti  10      NA    NA     1    NA   NA      NA 10
    ## 240        a           10      NA    NA     1    NA   NA      NA 10
    ## 241        a           10      NA    NA     6    NA   NA      NA 60
    ## 242        a           10      NA    NA     1    NA   NA      NA 10
    ## 243        a           10      NA    NA     3    NA   NA      NA 30
    ## 244        a           10      NA    NA     1    NA   NA      NA 10
    ## 245        p     viti  10      NA    NA          NA   NA      NA  0
    ## 246        m     viti  10      NA    NA     1    NA   NA      NA 10
    ## 247        p     viti  10      NA    NA     3    NA   NA      NA 30
    ## 248        a           10      NA    NA     5    NA   NA      NA 50
    ##     seedling.numb
    ## 239           100
    ## 240            75
    ## 241            10
    ## 242            75
    ## 243            50
    ## 244            10
    ## 245            10
    ## 246             1
    ## 247            10
    ## 248            75

<br>

<!-- note to self: the following code was tried for purpose of manipulating data. Either it didn't work or was subsequently deemed not necessary -->

``` r
#plot.data <- input.data
#code below to convert character variables to factor variables. I don't think this is necessary.
#
  #select(harvest, location, low.spp, invasive.spp, mid.spp, upper.spp, vine.spp) %>% 
 # mutate_if(is.character,as.factor)

#    These are redundant with the more thorough output of "skim"
#str(plot.data)
#glimpse(plot.data)
#names(plot.data)
#dim(plot.data)
#skimr::skim_tee(plot.data) - same as previous line

#the following does not work. Variable "maple" should be integer
#plot.data %>% 
#  mutate_at(vars(beech, maple, birch, hdwd,conifer),integer)

#the following does not work...note maple is "character"
#plot.data %>% 
#  cols(
#    maple=col_integer()
#  )
```

<br>

### Subset data, group and summarize for harvest x location

``` r
# Sort and group data by site (harvest name + interior vs. control)
# https://cmdlinetips.com/2020/08/dplyr-groupby-and-summarize-group-by-one-or-more-variables/ 
# Pat Sullivan suggested adding "as.data.frame()" which worked for him but not for me.
# Pat may have been using a different version of dyplr or maybe base R.


site <- plot.data %>% 
  filter(location =="interior" | location=="control") %>% 
  select(harvest, location, ba) %>% 
  group_by(harvest, location) %>% 
  summarize(basal_area = mean(ba)) %>% 
  as.data.frame()

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

### Iteration of filter and select in attempt to de-bug

``` r
site <- plot.data %>% 
  filter(location =="interior" | location=="control") %>% 
  select(harvest, location, ba)

  head(site)
```

    ##   harvest location ba
    ## 1    boot interior 20
    ## 2    boot interior 10
    ## 3    boot interior 30
    ## 4    boot interior 30
    ## 5    boot interior 60
    ## 6    boot interior 30

<br> \#\#\# Iteration of filter, select and group\_by

``` r
site <- plot.data %>% 
  filter(location =="interior" | location=="control") %>% 
  select(harvest, location, ba) %>% 
  group_by(harvest, location)

head(site, n=10)
```

    ## # A tibble: 10 x 3
    ## # Groups:   harvest, location [1]
    ##    harvest location    ba
    ##    <chr>   <chr>    <int>
    ##  1 boot    interior    20
    ##  2 boot    interior    10
    ##  3 boot    interior    30
    ##  4 boot    interior    30
    ##  5 boot    interior    60
    ##  6 boot    interior    30
    ##  7 boot    interior     0
    ##  8 boot    interior    40
    ##  9 boot    interior    30
    ## 10 boot    interior    20

<br> \#\#\# Iteration of filter, select, group\_by, and summarize

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
