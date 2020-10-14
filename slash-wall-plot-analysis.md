Slash Wall Plot Analysis
================
Peter Smallidge
10/14/2020

<br>

\#Read data files as csv located within the repository \#Conduct basic
visualization of the data \#\#Use the function “skim” to provide summary
statistics \#\#Use the function “table”, “names”, and “dim”

``` r
setwd("~/R/slash-wall-vegetation")
input.data = read.table("plot-data-2019.csv", header = TRUE, sep = ",")
# str(input.data) displays the structure of the variables

plot.data <- input.data
#code below to convert character variables to factor variables. I don't think this is necessary.
#
  #select(harvest, location, low.spp, invasive.spp, mid.spp, upper.spp, vine.spp) %>% 
 # mutate_if(is.character,as.factor)

str(plot.data)
```

    ## 'data.frame':    248 obs. of  28 variables:
    ##  $ harvest      : chr  "Boot" "Boot" "Boot" "Boot" ...
    ##  $ season       : int  2019 2019 2019 2019 2019 2019 2019 2019 2019 2019 ...
    ##  $ date         : chr  "2020.06.16" "2020.06.16" "2020.06.17" "2020.06.22" ...
    ##  $ location     : chr  "interior" "interior" "interior" "interior" ...
    ##  $ plot         : int  349 350 351 352 353 354 355 356 357 358 ...
    ##  $ disturb      : chr  "l" "m" "a" "m" ...
    ##  $ slash        : chr  "p" "p" "m" "m" ...
    ##  $ fern         : chr  "a" "m" "a" "l" ...
    ##  $ herb         : chr  "m" "l" "p" "p" ...
    ##  $ low.cov      : chr  "h" "h" "m" "h" ...
    ##  $ low.spp      : chr  "rubu" "rubu" "rubu" "rubu" ...
    ##  $ invasive.cov : chr  "p" "a" "a" "a" ...
    ##  $ invasive.spp : chr  "loni" "" "" "" ...
    ##  $ mid.cov      : chr  "p" "p" "m" "p" ...
    ##  $ mid.spp      : chr  "761" "761" "531" "372" ...
    ##  $ upper.cov    : chr  "l" "p" "m" "l" ...
    ##  $ upper.spp    : int  318 531 531 318 316 316 NA 316 NA 316 ...
    ##  $ vine.cov     : chr  "a" "a" "a" "a" ...
    ##  $ vine.spp     : chr  "" "" "" "" ...
    ##  $ baf          : int  10 10 10 10 10 10 10 10 10 10 ...
    ##  $ oakhick      : int  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ beech        : int  NA 1 1 NA NA NA NA NA NA NA ...
    ##  $ maple        : chr  "2" "" "2" "3" ...
    ##  $ birch        : int  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ hdwd         : int  NA NA NA NA 1 NA NA NA NA NA ...
    ##  $ conifer      : int  NA NA NA NA NA NA NA NA NA NA ...
    ##  $ ba           : int  20 10 30 30 60 30 0 40 30 20 ...
    ##  $ seedling.numb: int  100 50 100 100 25 10 100 10 0 10 ...

``` r
glimpse(plot.data)
```

    ## Rows: 248
    ## Columns: 28
    ## $ harvest       <chr> "Boot", "Boot", "Boot", "Boot", "Boot", "Boot", "Boot...
    ## $ season        <int> 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019, 2019,...
    ## $ date          <chr> "2020.06.16", "2020.06.16", "2020.06.17", "2020.06.22...
    ## $ location      <chr> "interior", "interior", "interior", "interior", "inte...
    ## $ plot          <int> 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359...
    ## $ disturb       <chr> "l", "m", "a", "m", "p", "p", "p", "l", "a", "l", "p"...
    ## $ slash         <chr> "p", "p", "m", "m", "m", "h", "p", "h", "h", "m", "m"...
    ## $ fern          <chr> "a", "m", "a", "l", "m", "l", "a", "p", "h", "p", "p"...
    ## $ herb          <chr> "m", "l", "p", "p", "m", "p", "p", "p", "p", "p", "p"...
    ## $ low.cov       <chr> "h", "h", "m", "h", "m", "h", "h", "h", "m", "h", "h"...
    ## $ low.spp       <chr> "rubu", "rubu", "rubu", "rubu", "rubu", "rubu", "rubu...
    ## $ invasive.cov  <chr> "p", "a", "a", "a", "p", "a", "a", "a", "a", "a", "a"...
    ## $ invasive.spp  <chr> "loni", "", "", "", "rosa", "", "", "", "", "", "", "...
    ## $ mid.cov       <chr> "p", "p", "m", "p", "p", "p", "m", "p", "l", "p", "m"...
    ## $ mid.spp       <chr> "761", "761", "531", "372", "951", "samb", "761", "76...
    ## $ upper.cov     <chr> "l", "p", "m", "l", "m", "p", "a", "m", "a", "p", "l"...
    ## $ upper.spp     <int> 318, 531, 531, 318, 316, 316, NA, 316, NA, 316, 316, ...
    ## $ vine.cov      <chr> "a", "a", "a", "a", "p", "p", "a", "a", "p", "p", "a"...
    ## $ vine.spp      <chr> "", "", "", "", "viti", "viti", "", "", "viti", "viti...
    ## $ baf           <int> 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 1...
    ## $ oakhick       <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA, NA...
    ## $ beech         <int> NA, 1, 1, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA, NA, ...
    ## $ maple         <chr> "2", "", "2", "3", "5", "3", "", "4", "3", "2", "4", ...
    ## $ birch         <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ hdwd          <int> NA, NA, NA, NA, 1, NA, NA, NA, NA, NA, NA, NA, NA, NA...
    ## $ conifer       <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N...
    ## $ ba            <int> 20, 10, 30, 30, 60, 30, 0, 40, 30, 20, 40, 60, 50, 20...
    ## $ seedling.numb <int> 100, 50, 100, 100, 25, 10, 100, 10, 0, 10, 50, 50, 10...

``` r
names(plot.data)
```

    ##  [1] "harvest"       "season"        "date"          "location"     
    ##  [5] "plot"          "disturb"       "slash"         "fern"         
    ##  [9] "herb"          "low.cov"       "low.spp"       "invasive.cov" 
    ## [13] "invasive.spp"  "mid.cov"       "mid.spp"       "upper.cov"    
    ## [17] "upper.spp"     "vine.cov"      "vine.spp"      "baf"          
    ## [21] "oakhick"       "beech"         "maple"         "birch"        
    ## [25] "hdwd"          "conifer"       "ba"            "seedling.numb"

``` r
dim(plot.data)
```

    ## [1] 248  28

``` r
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
#
```

<br>

\#Subset full data, group by harvest x location

``` r
#sort and group df=plot.data by harvest name and location of plots

# 1. create new data frame df=site
site <- plot.data %>%
  
# 2. exclude the rows=plots located on the perimeter
  filter(location == "interior" | location == "control") %>% 
  
# 3. retain variables for subsequent analysis
#  select(harvest, location, low.cov, invasive.cov, mid.cov, upper.cov,
#       ba, seedling.numb) %>%
  
  select(harvest, location, ba) %>%

# 4. group the remaining data by harvest name and interior vs. control
  group_by(harvest,location)

print(site)
```

    ## # A tibble: 174 x 3
    ## # Groups:   harvest, location [7]
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
    ## # ... with 164 more rows

``` r
# 5.calculate average basal area
 ba_summ <- site %>% 
   group_by(harvest, location) %>% 
  #summarize(basal_area = mean(ba)) %>% 
  table()
  #pivot_wider(names_from = location,
 #             values_from = basal_area)
  
view(ba_summ)

#site %>% 
#  select(harvest, location, basal_area) %>% 
#  table()
```
