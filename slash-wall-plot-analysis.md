Slash Wall Plot Analysis
================
Peter Smallidge
10/14/2020

<br>

## Read data files as csv located within the repository

## Conduct basic visualization of the data

## Use the function “skim” to provide summary statistics

``` r
#setwd("~/R/slash-wall-vegetation")
#input.data = read.table("plot-data-2019.csv", header = TRUE, sep = ",")
#plot.data <- input.data

plot.data = read_csv("~/R/slash-wall-vegetation/plot-data-2019.csv")
```

    ## 
    ## -- Column specification --------------------------------------------------------
    ## cols(
    ##   .default = col_character(),
    ##   season = col_double(),
    ##   point = col_double(),
    ##   upper_spp = col_double(),
    ##   baf = col_double(),
    ##   oakhick = col_double(),
    ##   beech = col_double(),
    ##   maple = col_double(),
    ##   birch = col_double(),
    ##   hdwd = col_double(),
    ##   conifer = col_double(),
    ##   ba = col_double(),
    ##   `seedling-numb` = col_double()
    ## )
    ## i Use `spec()` for the full column specifications.

``` r
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
| character                                        | 16        |
| numeric                                          | 12        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |           |
| Group variables                                  | None      |

Data summary

**Variable type: character**

| skim\_variable | n\_missing | complete\_rate | min | max | empty | n\_unique | whitespace |
| :------------- | ---------: | -------------: | --: | --: | ----: | --------: | ---------: |
| harvest        |          0 |           1.00 |   2 |   5 |     0 |         7 |          0 |
| date           |          0 |           1.00 |  10 |  10 |     0 |        35 |          0 |
| location       |          0 |           1.00 |   7 |   9 |     0 |         3 |          0 |
| disturb        |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| slash          |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| fern           |          8 |           0.97 |   1 |   1 |     0 |         6 |          0 |
| herb           |          0 |           1.00 |   1 |   4 |     0 |         6 |          0 |
| low\_cov       |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| low\_spp       |          0 |           1.00 |   4 |   4 |     0 |         4 |          0 |
| invasive\_cov  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| invasive\_spp  |        212 |           0.15 |   4 |   4 |     0 |         4 |          0 |
| mid\_cov       |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| mid\_spp       |         18 |           0.93 |   3 |   4 |     0 |        29 |          0 |
| upper\_cov     |          1 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| vine\_cov      |          3 |           0.99 |   1 |   1 |     0 |         4 |          0 |
| vine\_spp      |        188 |           0.24 |   4 |   4 |     0 |         4 |          0 |

**Variable type: numeric**

| skim\_variable | n\_missing | complete\_rate |    mean |     sd |   p0 |     p25 |    p50 |     p75 | p100 | hist  |
| :------------- | ---------: | -------------: | ------: | -----: | ---: | ------: | -----: | ------: | ---: | :---- |
| season         |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| point          |          0 |           1.00 |  705.92 | 217.25 |  334 |  395.75 |  773.5 |  860.25 |  975 | ▆▁▁▇▆ |
| upper\_spp     |         79 |           0.68 |  503.75 | 245.79 |  129 |  318.00 |  318.0 |  833.00 |  951 | ▁▇▁▁▅ |
| baf            |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| oakhick        |        178 |           0.28 |    2.04 |   1.16 |    1 |    1.00 |    2.0 |    3.00 |    5 | ▇▃▃▂▁ |
| beech          |        236 |           0.05 |    1.42 |   0.67 |    1 |    1.00 |    1.0 |    2.00 |    3 | ▇▁▃▁▁ |
| maple          |        138 |           0.44 |    2.73 |   1.92 |    1 |    1.00 |    2.0 |    4.00 |   10 | ▇▃▂▁▁ |
| birch          |        242 |           0.02 |    1.00 |   0.00 |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| hdwd           |        233 |           0.06 |    1.20 |   0.41 |    1 |    1.00 |    1.0 |    1.00 |    2 | ▇▁▁▁▂ |
| conifer        |        237 |           0.04 |    1.36 |   0.67 |    1 |    1.00 |    1.0 |    1.50 |    3 | ▇▁▂▁▁ |
| ba             |          0 |           1.00 |   20.12 |  19.85 |    0 |    0.00 |   20.0 |   30.00 |  100 | ▇▂▂▁▁ |
| seedling-numb  |         80 |           0.68 |   24.79 |  29.96 |    0 |    1.00 |   10.0 |   43.25 |  100 | ▇▂▂▁▁ |

``` r
table(plot.data$ba)
```

    ## 
    ##   0  10  20  30  40  50  60  70  80 100 
    ##  71  52  41  31  19  20   8   2   3   1

``` r
### test the grouping function in skim, which reports "grouping" variables ###

plot.data %>% 
  arrange(harvest, location) %>% 
  group_by(harvest,location) %>% 
  skim()
```

|                                                  |                   |
| :----------------------------------------------- | :---------------- |
| Name                                             | Piped data        |
| Number of rows                                   | 248               |
| Number of columns                                | 28                |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |                   |
| Column type frequency:                           |                   |
| character                                        | 14                |
| numeric                                          | 12                |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |                   |
| Group variables                                  | harvest, location |

Data summary

**Variable type: character**

| skim\_variable | harvest | location  | n\_missing | complete\_rate | min | max | empty | n\_unique | whitespace |
| :------------- | :------ | :-------- | ---------: | -------------: | --: | --: | ----: | --------: | ---------: |
| date           | boot    | interior  |          0 |           1.00 |  10 |  10 |     0 |         6 |          0 |
| date           | boot    | perimeter |          0 |           1.00 |  10 |  10 |     0 |         6 |          0 |
| date           | cgl     | control   |          0 |           1.00 |  10 |  10 |     0 |         3 |          0 |
| date           | crp     | control   |          0 |           1.00 |  10 |  10 |     0 |         2 |          0 |
| date           | cwb     | control   |          0 |           1.00 |  10 |  10 |     0 |         4 |          0 |
| date           | gl      | interior  |          0 |           1.00 |  10 |  10 |     0 |         9 |          0 |
| date           | gl      | perimeter |          0 |           1.00 |  10 |  10 |     0 |         5 |          0 |
| date           | rp      | interior  |          0 |           1.00 |  10 |  10 |     0 |         5 |          0 |
| date           | rp      | perimeter |          0 |           1.00 |  10 |  10 |     0 |         4 |          0 |
| date           | wedge   | interior  |          0 |           1.00 |  10 |  10 |     0 |         3 |          0 |
| date           | wedge   | perimeter |          0 |           1.00 |  10 |  10 |     0 |         3 |          0 |
| disturb        | boot    | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| disturb        | boot    | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| disturb        | cgl     | control   |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| disturb        | crp     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| disturb        | cwb     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| disturb        | gl      | interior  |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| disturb        | gl      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| disturb        | rp      | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| disturb        | rp      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| disturb        | wedge   | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| disturb        | wedge   | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| slash          | boot    | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| slash          | boot    | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| slash          | cgl     | control   |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| slash          | crp     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| slash          | cwb     | control   |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| slash          | gl      | interior  |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| slash          | gl      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| slash          | rp      | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| slash          | rp      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| slash          | wedge   | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| slash          | wedge   | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| fern           | boot    | interior  |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| fern           | boot    | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| fern           | cgl     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| fern           | crp     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| fern           | cwb     | control   |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| fern           | gl      | interior  |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| fern           | gl      | perimeter |          8 |           0.77 |   1 |   1 |     0 |         4 |          0 |
| fern           | rp      | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| fern           | rp      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         1 |          0 |
| fern           | wedge   | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| fern           | wedge   | perimeter |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| herb           | boot    | interior  |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| herb           | boot    | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| herb           | cgl     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| herb           | crp     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| herb           | cwb     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| herb           | gl      | interior  |          0 |           1.00 |   1 |   4 |     0 |         5 |          0 |
| herb           | gl      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| herb           | rp      | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| herb           | rp      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| herb           | wedge   | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| herb           | wedge   | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| low\_cov       | boot    | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| low\_cov       | boot    | perimeter |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| low\_cov       | cgl     | control   |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| low\_cov       | crp     | control   |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| low\_cov       | cwb     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| low\_cov       | gl      | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| low\_cov       | gl      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| low\_cov       | rp      | interior  |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| low\_cov       | rp      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| low\_cov       | wedge   | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| low\_cov       | wedge   | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| low\_spp       | boot    | interior  |          0 |           1.00 |   4 |   4 |     0 |         2 |          0 |
| low\_spp       | boot    | perimeter |          0 |           1.00 |   4 |   4 |     0 |         2 |          0 |
| low\_spp       | cgl     | control   |          0 |           1.00 |   4 |   4 |     0 |         1 |          0 |
| low\_spp       | crp     | control   |          0 |           1.00 |   4 |   4 |     0 |         2 |          0 |
| low\_spp       | cwb     | control   |          0 |           1.00 |   4 |   4 |     0 |         2 |          0 |
| low\_spp       | gl      | interior  |          0 |           1.00 |   4 |   4 |     0 |         1 |          0 |
| low\_spp       | gl      | perimeter |          0 |           1.00 |   4 |   4 |     0 |         2 |          0 |
| low\_spp       | rp      | interior  |          0 |           1.00 |   4 |   4 |     0 |         2 |          0 |
| low\_spp       | rp      | perimeter |          0 |           1.00 |   4 |   4 |     0 |         1 |          0 |
| low\_spp       | wedge   | interior  |          0 |           1.00 |   4 |   4 |     0 |         1 |          0 |
| low\_spp       | wedge   | perimeter |          0 |           1.00 |   4 |   4 |     0 |         1 |          0 |
| invasive\_cov  | boot    | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| invasive\_cov  | boot    | perimeter |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| invasive\_cov  | cgl     | control   |          0 |           1.00 |   1 |   1 |     0 |         1 |          0 |
| invasive\_cov  | crp     | control   |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| invasive\_cov  | cwb     | control   |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| invasive\_cov  | gl      | interior  |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| invasive\_cov  | gl      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| invasive\_cov  | rp      | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| invasive\_cov  | rp      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| invasive\_cov  | wedge   | interior  |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| invasive\_cov  | wedge   | perimeter |          0 |           1.00 |   1 |   1 |     0 |         1 |          0 |
| invasive\_spp  | boot    | interior  |         17 |           0.19 |   4 |   4 |     0 |         2 |          0 |
| invasive\_spp  | boot    | perimeter |         13 |           0.19 |   4 |   4 |     0 |         2 |          0 |
| invasive\_spp  | cgl     | control   |         17 |           0.00 |  NA |  NA |     0 |         0 |          0 |
| invasive\_spp  | crp     | control   |         22 |           0.24 |   4 |   4 |     0 |         2 |          0 |
| invasive\_spp  | cwb     | control   |         24 |           0.29 |   4 |   4 |     0 |         1 |          0 |
| invasive\_spp  | gl      | interior  |         43 |           0.02 |   4 |   4 |     0 |         1 |          0 |
| invasive\_spp  | gl      | perimeter |         34 |           0.03 |   4 |   4 |     0 |         1 |          0 |
| invasive\_spp  | rp      | interior  |         10 |           0.33 |   4 |   4 |     0 |         2 |          0 |
| invasive\_spp  | rp      | perimeter |          9 |           0.31 |   4 |   4 |     0 |         3 |          0 |
| invasive\_spp  | wedge   | interior  |         13 |           0.07 |   4 |   4 |     0 |         1 |          0 |
| invasive\_spp  | wedge   | perimeter |         10 |           0.00 |  NA |  NA |     0 |         0 |          0 |
| mid\_cov       | boot    | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| mid\_cov       | boot    | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| mid\_cov       | cgl     | control   |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| mid\_cov       | crp     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| mid\_cov       | cwb     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| mid\_cov       | gl      | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| mid\_cov       | gl      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| mid\_cov       | rp      | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| mid\_cov       | rp      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| mid\_cov       | wedge   | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| mid\_cov       | wedge   | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| mid\_spp       | boot    | interior  |          0 |           1.00 |   3 |   4 |     0 |         6 |          0 |
| mid\_spp       | boot    | perimeter |          1 |           0.94 |   3 |   3 |     0 |         5 |          0 |
| mid\_spp       | cgl     | control   |          0 |           1.00 |   3 |   3 |     0 |         7 |          0 |
| mid\_spp       | crp     | control   |          2 |           0.93 |   3 |   3 |     0 |         9 |          0 |
| mid\_spp       | cwb     | control   |          8 |           0.76 |   3 |   4 |     0 |         8 |          0 |
| mid\_spp       | gl      | interior  |          5 |           0.89 |   3 |   4 |     0 |        15 |          0 |
| mid\_spp       | gl      | perimeter |          2 |           0.94 |   3 |   4 |     0 |         9 |          0 |
| mid\_spp       | rp      | interior  |          0 |           1.00 |   3 |   3 |     0 |         8 |          0 |
| mid\_spp       | rp      | perimeter |          0 |           1.00 |   3 |   3 |     0 |         7 |          0 |
| mid\_spp       | wedge   | interior  |          0 |           1.00 |   3 |   3 |     0 |         3 |          0 |
| mid\_spp       | wedge   | perimeter |          0 |           1.00 |   3 |   4 |     0 |         3 |          0 |
| upper\_cov     | boot    | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| upper\_cov     | boot    | perimeter |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| upper\_cov     | cgl     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| upper\_cov     | crp     | control   |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| upper\_cov     | cwb     | control   |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| upper\_cov     | gl      | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| upper\_cov     | gl      | perimeter |          1 |           0.97 |   1 |   1 |     0 |         3 |          0 |
| upper\_cov     | rp      | interior  |          0 |           1.00 |   1 |   1 |     0 |         4 |          0 |
| upper\_cov     | rp      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| upper\_cov     | wedge   | interior  |          0 |           1.00 |   1 |   1 |     0 |         5 |          0 |
| upper\_cov     | wedge   | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| vine\_cov      | boot    | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| vine\_cov      | boot    | perimeter |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| vine\_cov      | cgl     | control   |          1 |           0.94 |   1 |   1 |     0 |         2 |          0 |
| vine\_cov      | crp     | control   |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| vine\_cov      | cwb     | control   |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| vine\_cov      | gl      | interior  |          2 |           0.95 |   1 |   1 |     0 |         4 |          0 |
| vine\_cov      | gl      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| vine\_cov      | rp      | interior  |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| vine\_cov      | rp      | perimeter |          0 |           1.00 |   1 |   1 |     0 |         2 |          0 |
| vine\_cov      | wedge   | interior  |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| vine\_cov      | wedge   | perimeter |          0 |           1.00 |   1 |   1 |     0 |         3 |          0 |
| vine\_spp      | boot    | interior  |         14 |           0.33 |   4 |   4 |     0 |         1 |          0 |
| vine\_spp      | boot    | perimeter |         11 |           0.31 |   4 |   4 |     0 |         1 |          0 |
| vine\_spp      | cgl     | control   |         14 |           0.18 |   4 |   4 |     0 |         2 |          0 |
| vine\_spp      | crp     | control   |         21 |           0.28 |   4 |   4 |     0 |         1 |          0 |
| vine\_spp      | cwb     | control   |         31 |           0.09 |   4 |   4 |     0 |         1 |          0 |
| vine\_spp      | gl      | interior  |         29 |           0.34 |   4 |   4 |     0 |         3 |          0 |
| vine\_spp      | gl      | perimeter |         34 |           0.03 |   4 |   4 |     0 |         1 |          0 |
| vine\_spp      | rp      | interior  |          9 |           0.40 |   4 |   4 |     0 |         1 |          0 |
| vine\_spp      | rp      | perimeter |         10 |           0.23 |   4 |   4 |     0 |         1 |          0 |
| vine\_spp      | wedge   | interior  |          9 |           0.36 |   4 |   4 |     0 |         1 |          0 |
| vine\_spp      | wedge   | perimeter |          6 |           0.40 |   4 |   4 |     0 |         1 |          0 |

**Variable type: numeric**

| skim\_variable | harvest | location  | n\_missing | complete\_rate |    mean |     sd |   p0 |     p25 |    p50 |     p75 | p100 | hist  |
| :------------- | :------ | :-------- | ---------: | -------------: | ------: | -----: | ---: | ------: | -----: | ------: | ---: | :---- |
| season         | boot    | interior  |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | boot    | perimeter |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | cgl     | control   |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | crp     | control   |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | cwb     | control   |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | gl      | interior  |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | gl      | perimeter |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | rp      | interior  |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | rp      | perimeter |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | wedge   | interior  |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| season         | wedge   | perimeter |          0 |           1.00 | 2019.00 |   0.00 | 2019 | 2019.00 | 2019.0 | 2019.00 | 2019 | ▁▁▇▁▁ |
| point          | boot    | interior  |          0 |           1.00 |  359.00 |   6.20 |  349 |  354.00 |  359.0 |  364.00 |  369 | ▇▆▆▆▆ |
| point          | boot    | perimeter |          0 |           1.00 |  957.50 |   4.76 |  950 |  953.75 |  957.5 |  961.25 |  965 | ▇▆▆▆▆ |
| point          | cgl     | control   |          0 |           1.00 |  737.00 |   5.05 |  729 |  733.00 |  737.0 |  741.00 |  745 | ▇▆▆▆▇ |
| point          | crp     | control   |          0 |           1.00 |  760.90 |   8.68 |  746 |  754.00 |  761.0 |  768.00 |  775 | ▇▇▇▇▇ |
| point          | cwb     | control   |          0 |           1.00 |  577.79 | 202.35 |  384 |  392.25 |  550.5 |  708.75 |  949 | ▇▁▆▁▂ |
| point          | gl      | interior  |          0 |           1.00 |  857.50 |  12.85 |  836 |  846.75 |  857.5 |  868.25 |  879 | ▇▇▇▇▇ |
| point          | gl      | perimeter |          0 |           1.00 |  818.00 |  10.25 |  801 |  809.50 |  818.0 |  826.50 |  835 | ▇▇▇▇▇ |
| point          | rp      | interior  |          0 |           1.00 |  341.00 |   4.47 |  334 |  337.50 |  341.0 |  344.50 |  348 | ▇▇▇▇▇ |
| point          | rp      | perimeter |          0 |           1.00 |  886.00 |   3.89 |  880 |  883.00 |  886.0 |  889.00 |  892 | ▇▅▇▅▇ |
| point          | wedge   | interior  |          0 |           1.00 |  376.50 |   4.18 |  370 |  373.25 |  376.5 |  379.75 |  383 | ▇▇▅▇▇ |
| point          | wedge   | perimeter |          0 |           1.00 |  970.50 |   3.03 |  966 |  968.25 |  970.5 |  972.75 |  975 | ▇▇▇▇▇ |
| upper\_spp     | boot    | interior  |          2 |           0.90 |  399.68 | 187.07 |  316 |  316.00 |  316.0 |  318.00 |  951 | ▇▁▁▁▁ |
| upper\_spp     | boot    | perimeter |          2 |           0.88 |  442.57 | 219.06 |  316 |  316.00 |  317.0 |  477.75 |  833 | ▇▁▁▁▂ |
| upper\_spp     | cgl     | control   |          0 |           1.00 |  833.00 |   0.00 |  833 |  833.00 |  833.0 |  833.00 |  833 | ▁▁▇▁▁ |
| upper\_spp     | crp     | control   |         11 |           0.62 |  668.44 | 277.68 |  129 |  487.00 |  832.5 |  833.00 |  833 | ▂▁▁▁▇ |
| upper\_spp     | cwb     | control   |          3 |           0.91 |  341.65 | 113.90 |  316 |  318.00 |  318.0 |  318.00 |  951 | ▇▁▁▁▁ |
| upper\_spp     | gl      | interior  |         27 |           0.39 |  416.18 | 177.25 |  318 |  318.00 |  318.0 |  531.00 |  833 | ▇▁▂▁▁ |
| upper\_spp     | gl      | perimeter |         20 |           0.43 |  639.60 | 232.23 |  318 |  372.00 |  762.0 |  833.00 |  833 | ▅▁▁▁▇ |
| upper\_spp     | rp      | interior  |          7 |           0.53 |  671.38 | 282.06 |  129 |  651.00 |  832.0 |  832.25 |  833 | ▁▁▁▁▇ |
| upper\_spp     | rp      | perimeter |          6 |           0.54 |  685.57 | 251.78 |  316 |  575.50 |  833.0 |  833.00 |  833 | ▃▁▁▁▇ |
| upper\_spp     | wedge   | interior  |          1 |           0.93 |  350.15 |  80.27 |  316 |  316.00 |  318.0 |  318.00 |  531 | ▇▁▁▁▂ |
| upper\_spp     | wedge   | perimeter |          0 |           1.00 |  316.80 |   1.03 |  316 |  316.00 |  316.0 |  318.00 |  318 | ▇▁▁▁▅ |
| baf            | boot    | interior  |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | boot    | perimeter |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | cgl     | control   |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | crp     | control   |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | cwb     | control   |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | gl      | interior  |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | gl      | perimeter |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | rp      | interior  |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | rp      | perimeter |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | wedge   | interior  |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| baf            | wedge   | perimeter |          0 |           1.00 |   10.00 |   0.00 |   10 |   10.00 |   10.0 |   10.00 |   10 | ▁▁▇▁▁ |
| oakhick        | boot    | interior  |         17 |           0.19 |    1.75 |   0.96 |    1 |    1.00 |    1.5 |    2.25 |    3 | ▇▁▃▁▃ |
| oakhick        | boot    | perimeter |         10 |           0.38 |    2.00 |   1.26 |    1 |    1.00 |    1.5 |    2.75 |    4 | ▇▂▁▂▂ |
| oakhick        | cgl     | control   |          0 |           1.00 |    2.94 |   1.14 |    1 |    2.00 |    3.0 |    4.00 |    5 | ▁▇▇▃▂ |
| oakhick        | crp     | control   |         13 |           0.55 |    2.38 |   1.15 |    1 |    1.00 |    2.5 |    3.00 |    4 | ▇▅▁▇▅ |
| oakhick        | cwb     | control   |         34 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| oakhick        | gl      | interior  |         36 |           0.18 |    1.12 |   0.35 |    1 |    1.00 |    1.0 |    1.00 |    2 | ▇▁▁▁▁ |
| oakhick        | gl      | perimeter |         24 |           0.31 |    1.45 |   0.82 |    1 |    1.00 |    1.0 |    1.50 |    3 | ▇▁▁▁▂ |
| oakhick        | rp      | interior  |          9 |           0.40 |    1.50 |   0.84 |    1 |    1.00 |    1.0 |    1.75 |    3 | ▇▁▂▁▂ |
| oakhick        | rp      | perimeter |         12 |           0.08 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| oakhick        | wedge   | interior  |         13 |           0.07 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| oakhick        | wedge   | perimeter |         10 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| beech          | boot    | interior  |         18 |           0.14 |    1.00 |   0.00 |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| beech          | boot    | perimeter |         14 |           0.12 |    1.00 |   0.00 |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| beech          | cgl     | control   |         17 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| beech          | crp     | control   |         29 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| beech          | cwb     | control   |         32 |           0.06 |    2.00 |   1.41 |    1 |    1.50 |    2.0 |    2.50 |    3 | ▇▁▁▁▇ |
| beech          | gl      | interior  |         41 |           0.07 |    1.67 |   0.58 |    1 |    1.50 |    2.0 |    2.00 |    2 | ▃▁▁▁▇ |
| beech          | gl      | perimeter |         35 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| beech          | rp      | interior  |         15 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| beech          | rp      | perimeter |         13 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| beech          | wedge   | interior  |         12 |           0.14 |    1.50 |   0.71 |    1 |    1.25 |    1.5 |    1.75 |    2 | ▇▁▁▁▇ |
| beech          | wedge   | perimeter |         10 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| maple          | boot    | interior  |          3 |           0.86 |    3.28 |   1.32 |    1 |    2.00 |    3.0 |    4.00 |    6 | ▇▅▇▂▁ |
| maple          | boot    | perimeter |          4 |           0.75 |    1.83 |   0.83 |    1 |    1.00 |    2.0 |    2.25 |    3 | ▇▁▆▁▅ |
| maple          | cgl     | control   |         17 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| maple          | crp     | control   |         27 |           0.07 |    1.00 |   0.00 |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| maple          | cwb     | control   |          2 |           0.94 |    3.59 |   1.74 |    1 |    2.00 |    3.5 |    5.00 |    7 | ▇▅▃▆▃ |
| maple          | gl      | interior  |         28 |           0.36 |    1.19 |   0.40 |    1 |    1.00 |    1.0 |    1.00 |    2 | ▇▁▁▁▂ |
| maple          | gl      | perimeter |         28 |           0.20 |    1.14 |   0.38 |    1 |    1.00 |    1.0 |    1.00 |    2 | ▇▁▁▁▁ |
| maple          | rp      | interior  |         14 |           0.07 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| maple          | rp      | perimeter |         12 |           0.08 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| maple          | wedge   | interior  |          2 |           0.86 |    4.25 |   3.05 |    1 |    1.75 |    3.5 |    5.75 |   10 | ▇▆▃▃▂ |
| maple          | wedge   | perimeter |          1 |           0.90 |    2.44 |   1.94 |    1 |    1.00 |    1.0 |    3.00 |    6 | ▇▃▁▂▂ |
| birch          | boot    | interior  |         21 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| birch          | boot    | perimeter |         15 |           0.06 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| birch          | cgl     | control   |         17 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| birch          | crp     | control   |         28 |           0.03 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| birch          | cwb     | control   |         31 |           0.09 |    1.00 |   0.00 |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| birch          | gl      | interior  |         44 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| birch          | gl      | perimeter |         34 |           0.03 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| birch          | rp      | interior  |         15 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| birch          | rp      | perimeter |         13 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| birch          | wedge   | interior  |         14 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| birch          | wedge   | perimeter |         10 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| hdwd           | boot    | interior  |         18 |           0.14 |    1.33 |   0.58 |    1 |    1.00 |    1.0 |    1.50 |    2 | ▇▁▁▁▃ |
| hdwd           | boot    | perimeter |         15 |           0.06 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| hdwd           | cgl     | control   |         16 |           0.06 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| hdwd           | crp     | control   |         29 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| hdwd           | cwb     | control   |         27 |           0.21 |    1.29 |   0.49 |    1 |    1.00 |    1.0 |    1.50 |    2 | ▇▁▁▁▃ |
| hdwd           | gl      | interior  |         44 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| hdwd           | gl      | perimeter |         32 |           0.09 |    1.00 |   0.00 |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| hdwd           | rp      | interior  |         15 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| hdwd           | rp      | perimeter |         13 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| hdwd           | wedge   | interior  |         14 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| hdwd           | wedge   | perimeter |         10 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| conifer        | boot    | interior  |         21 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| conifer        | boot    | perimeter |         16 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| conifer        | cgl     | control   |         16 |           0.06 |    1.00 |     NA |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| conifer        | crp     | control   |         21 |           0.28 |    1.50 |   0.76 |    1 |    1.00 |    1.0 |    2.00 |    3 | ▇▁▃▁▂ |
| conifer        | cwb     | control   |         34 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| conifer        | gl      | interior  |         44 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| conifer        | gl      | perimeter |         35 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| conifer        | rp      | interior  |         13 |           0.13 |    1.00 |   0.00 |    1 |    1.00 |    1.0 |    1.00 |    1 | ▁▁▇▁▁ |
| conifer        | rp      | perimeter |         13 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| conifer        | wedge   | interior  |         14 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| conifer        | wedge   | perimeter |         10 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| ba             | boot    | interior  |          0 |           1.00 |   34.76 |  16.62 |    0 |   20.00 |   30.0 |   50.00 |   60 | ▂▅▇▅▇ |
| ba             | boot    | perimeter |          0 |           1.00 |   23.75 |  17.08 |    0 |   10.00 |   20.0 |   32.50 |   60 | ▇▇▃▃▃ |
| ba             | cgl     | control   |          0 |           1.00 |   30.59 |  12.49 |   10 |   20.00 |   30.0 |   40.00 |   50 | ▁▇▅▃▃ |
| ba             | crp     | control   |          0 |           1.00 |   18.28 |  15.37 |    0 |    0.00 |   20.0 |   30.00 |   50 | ▇▃▃▂▁ |
| ba             | cwb     | control   |          0 |           1.00 |   38.53 |  19.71 |    0 |   22.50 |   40.0 |   50.00 |   80 | ▃▇▂▇▂ |
| ba             | gl      | interior  |          0 |           1.00 |    7.50 |   9.18 |    0 |    0.00 |   10.0 |   10.00 |   40 | ▇▆▂▁▁ |
| ba             | gl      | perimeter |          0 |           1.00 |    8.00 |   9.64 |    0 |    0.00 |    0.0 |   15.00 |   30 | ▇▃▁▃▁ |
| ba             | rp      | interior  |          0 |           1.00 |    8.00 |   9.41 |    0 |    0.00 |   10.0 |   10.00 |   30 | ▇▆▁▂▁ |
| ba             | rp      | perimeter |          0 |           1.00 |    1.54 |   3.76 |    0 |    0.00 |    0.0 |    0.00 |   10 | ▇▁▁▁▂ |
| ba             | wedge   | interior  |          0 |           1.00 |   39.29 |  29.73 |    0 |   20.00 |   30.0 |   50.00 |  100 | ▇▆▃▃▂ |
| ba             | wedge   | perimeter |          0 |           1.00 |   22.00 |  19.89 |    0 |   10.00 |   10.0 |   30.00 |   60 | ▇▁▂▁▂ |
| seedling-numb  | boot    | interior  |          0 |           1.00 |   46.95 |  37.87 |    0 |   10.00 |   50.0 |   75.00 |  100 | ▇▁▅▂▅ |
| seedling-numb  | boot    | perimeter |          0 |           1.00 |   42.56 |  34.22 |    1 |   21.25 |   25.0 |   56.25 |  100 | ▆▇▅▂▅ |
| seedling-numb  | cgl     | control   |          0 |           1.00 |    1.94 |   3.05 |    0 |    1.00 |    1.0 |    1.00 |   10 | ▇▁▁▁▁ |
| seedling-numb  | crp     | control   |          0 |           1.00 |    5.66 |   7.71 |    1 |    1.00 |    1.0 |   10.00 |   25 | ▇▃▁▁▁ |
| seedling-numb  | cwb     | control   |          0 |           1.00 |   21.44 |  28.02 |    1 |    1.00 |   10.0 |   43.75 |  100 | ▇▁▂▁▁ |
| seedling-numb  | gl      | interior  |         44 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| seedling-numb  | gl      | perimeter |         35 |           0.00 |     NaN |     NA |   NA |      NA |     NA |      NA |   NA |       |
| seedling-numb  | rp      | interior  |          1 |           0.93 |   27.21 |  18.52 |    7 |   15.25 |   20.5 |   40.00 |   69 | ▇▂▃▁▁ |
| seedling-numb  | rp      | perimeter |          0 |           1.00 |   13.46 |   9.30 |    1 |    5.00 |   12.0 |   18.00 |   33 | ▇▆▆▃▂ |
| seedling-numb  | wedge   | interior  |          0 |           1.00 |   42.86 |  32.27 |   10 |   10.00 |   37.5 |   75.00 |  100 | ▇▁▂▅▁ |
| seedling-numb  | wedge   | perimeter |          0 |           1.00 |   41.60 |  37.22 |    1 |   10.00 |   30.0 |   75.00 |  100 | ▇▁▂▅▂ |

``` r
head(plot.data, n=10)
```

    ## # A tibble: 10 x 28
    ##    harvest season date  location point disturb slash fern  herb  low_cov low_spp
    ##    <chr>    <dbl> <chr> <chr>    <dbl> <chr>   <chr> <chr> <chr> <chr>   <chr>  
    ##  1 boot      2019 2020~ interior   349 l       p     a     m     h       rubu   
    ##  2 boot      2019 2020~ interior   350 m       p     m     l     h       rubu   
    ##  3 boot      2019 2020~ interior   351 a       m     a     p     m       rubu   
    ##  4 boot      2019 2020~ interior   352 m       m     l     p     h       rubu   
    ##  5 boot      2019 2020~ interior   353 p       m     m     m     m       rubu   
    ##  6 boot      2019 2020~ interior   354 p       h     l     p     h       rubu   
    ##  7 boot      2019 2020~ interior   355 p       p     a     p     h       rubu   
    ##  8 boot      2019 2020~ interior   356 l       h     p     p     h       rubu   
    ##  9 boot      2019 2020~ interior   357 a       h     h     p     m       rubu   
    ## 10 boot      2019 2020~ interior   358 l       m     p     p     h       samb   
    ## # ... with 17 more variables: invasive_cov <chr>, invasive_spp <chr>,
    ## #   mid_cov <chr>, mid_spp <chr>, upper_cov <chr>, upper_spp <dbl>,
    ## #   vine_cov <chr>, vine_spp <chr>, baf <dbl>, oakhick <dbl>, beech <dbl>,
    ## #   maple <dbl>, birch <dbl>, hdwd <dbl>, conifer <dbl>, ba <dbl>,
    ## #   `seedling-numb` <dbl>

``` r
tail(plot.data, n=10)
```

    ## # A tibble: 10 x 28
    ##    harvest season date  location point disturb slash fern  herb  low_cov low_spp
    ##    <chr>    <dbl> <chr> <chr>    <dbl> <chr>   <chr> <chr> <chr> <chr>   <chr>  
    ##  1 wedge     2019 2020~ perimet~   966 a       p     p     l     m       rubu   
    ##  2 wedge     2019 2020~ perimet~   967 p       p     p     l     h       rubu   
    ##  3 wedge     2019 2020~ perimet~   968 p       m     l     l     h       rubu   
    ##  4 wedge     2019 2020~ perimet~   969 l       l     l     l     h       rubu   
    ##  5 wedge     2019 2020~ perimet~   970 m       l     l     h     m       rubu   
    ##  6 wedge     2019 2020~ perimet~   971 m       l     l     m     m       rubu   
    ##  7 wedge     2019 2020~ perimet~   972 p       l     p     m     h       rubu   
    ##  8 wedge     2019 2020~ perimet~   973 l       l     p     h     m       rubu   
    ##  9 wedge     2019 2020~ perimet~   974 l       p     p     h     p       rubu   
    ## 10 wedge     2019 2020~ perimet~   975 m       l     p     m     l       rubu   
    ## # ... with 17 more variables: invasive_cov <chr>, invasive_spp <chr>,
    ## #   mid_cov <chr>, mid_spp <chr>, upper_cov <chr>, upper_spp <dbl>,
    ## #   vine_cov <chr>, vine_spp <chr>, baf <dbl>, oakhick <dbl>, beech <dbl>,
    ## #   maple <dbl>, birch <dbl>, hdwd <dbl>, conifer <dbl>, ba <dbl>,
    ## #   `seedling-numb` <dbl>

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
#  mutate(vars(maple, na.rm=TRUE),integer)

#spec(plot.data)

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
# Nina Thirkildsen suggested adding "dplyr::" before each verb. Including the package name
# is a way to ensure that it is the package's version of the verb that is used, 
# not a different package's verb.
# 
# UPDATE
# *** the problem was loading too many libraries with conflicts. 
# Currently just load tidyverse and skimr


site <- plot.data %>% 
 #filter(location =="interior" | location=="control") %>% 
  select(harvest, location, ba) %>% 
  group_by(harvest, location) %>% 
  summarize(basal_area = mean(ba)) %>% 
  arrange(harvest, location)
```

    ## `summarise()` regrouping output by 'harvest' (override with `.groups` argument)

``` r
site
```

    ## # A tibble: 11 x 3
    ## # Groups:   harvest [7]
    ##    harvest location  basal_area
    ##    <chr>   <chr>          <dbl>
    ##  1 boot    interior       34.8 
    ##  2 boot    perimeter      23.8 
    ##  3 cgl     control        30.6 
    ##  4 crp     control        18.3 
    ##  5 cwb     control        38.5 
    ##  6 gl      interior        7.5 
    ##  7 gl      perimeter       8   
    ##  8 rp      interior        8   
    ##  9 rp      perimeter       1.54
    ## 10 wedge   interior       39.3 
    ## 11 wedge   perimeter      22

``` r
write.table(site, "site_BA_means.txt", sep="\t")
```

``` r
#write.table(site, "site_BA_means.txt", sep="\t")
```

``` r
# site %>% 
# pivot_wider(names_from = location,
#             values_from = basal_area)
  
#view(ba_summ)
```
