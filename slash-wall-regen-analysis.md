Regneration Analysis
================
Peter Smallidge
10/17/2020

### Analysis of regeneation plot data - 2019

### read data from csv file, check variables and data structure

<!-- note to self: in the "read_csv" code, after the file location the code
for 'col..." etc ensures that the specified column is adjusted
the file "cheat sheet data-import" has details -->

``` r
input.data = read_csv("~/R/slash-wall-vegetation/regen-data-2019.csv",
                      col_types=cols(spp=col_character(), sup.seed03=col_number(),
                                     sup.sapl=col_number()))
str(input.data)
```

    ## tibble [927 x 18] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ harvest     : chr [1:927] "boot" "boot" "boot" "boot" ...
    ##  $ date        : chr [1:927] "2020.06.19" "2020.06.15" "2020.06.17" "2020.06.22" ...
    ##  $ location    : chr [1:927] "interior" "interior" "perimeter" "perimeter" ...
    ##  $ point       : num [1:927] 356 363 950 961 398 701 703 709 946 971 ...
    ##  $ spp         : chr [1:927] "001" "001" "001" "001" ...
    ##  $ origin      : chr [1:927] "u" "u" "u" "u" ...
    ##  $ radius.01   : num [1:927] 3.7 3.7 3.7 3.7 3.7 3.7 3.7 3.7 3.7 3.7 ...
    ##  $ radius.other: num [1:927] 6 6 6 6 6 6 6 6 6 6 ...
    ##  $ sup.seed01  : num [1:927] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ sup.seed02  : num [1:927] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ sup.seed03  : num [1:927] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ sup.sapl    : num [1:927] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ exp.seed01  : num [1:927] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ exp.seed02  : num [1:927] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ exp.seed03  : num [1:927] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ exp.sapl    : num [1:927] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ top4        : num [1:927] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ other       : logi [1:927] NA NA NA NA NA NA ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   harvest = col_character(),
    ##   ..   date = col_character(),
    ##   ..   location = col_character(),
    ##   ..   point = col_double(),
    ##   ..   spp = col_character(),
    ##   ..   origin = col_character(),
    ##   ..   radius.01 = col_double(),
    ##   ..   radius.other = col_double(),
    ##   ..   sup.seed01 = col_double(),
    ##   ..   sup.seed02 = col_double(),
    ##   ..   sup.seed03 = col_number(),
    ##   ..   sup.sapl = col_number(),
    ##   ..   exp.seed01 = col_double(),
    ##   ..   exp.seed02 = col_double(),
    ##   ..   exp.seed03 = col_double(),
    ##   ..   exp.sapl = col_double(),
    ##   ..   top4 = col_double(),
    ##   ..   other = col_logical()
    ##   .. )

``` r
regen.data <- input.data %>% 
  select(-other) %>% 
  filter(!spp == "ush")

str(regen.data)
```

    ## tibble [926 x 17] (S3: tbl_df/tbl/data.frame)
    ##  $ harvest     : chr [1:926] "boot" "boot" "boot" "boot" ...
    ##  $ date        : chr [1:926] "2020.06.19" "2020.06.15" "2020.06.17" "2020.06.22" ...
    ##  $ location    : chr [1:926] "interior" "interior" "perimeter" "perimeter" ...
    ##  $ point       : num [1:926] 356 363 950 961 398 701 703 709 946 971 ...
    ##  $ spp         : chr [1:926] "001" "001" "001" "001" ...
    ##  $ origin      : chr [1:926] "u" "u" "u" "u" ...
    ##  $ radius.01   : num [1:926] 3.7 3.7 3.7 3.7 3.7 3.7 3.7 3.7 3.7 3.7 ...
    ##  $ radius.other: num [1:926] 6 6 6 6 6 6 6 6 6 6 ...
    ##  $ sup.seed01  : num [1:926] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ sup.seed02  : num [1:926] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ sup.seed03  : num [1:926] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ sup.sapl    : num [1:926] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ exp.seed01  : num [1:926] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ exp.seed02  : num [1:926] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ exp.seed03  : num [1:926] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ exp.sapl    : num [1:926] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ top4        : num [1:926] NA NA NA NA NA NA NA NA NA NA ...

``` r
#check to ensure no unexpected values
  table(regen.data$spp)
```

    ## 
    ## 001 129 261 315 316 318 356 372 375 379 391 500 531 541 621 701 743 746 761 762 
    ##  10   1   1  26  87  34  62 125  27   2   8   2 115 105   3  10  89  20 104  23 
    ## 763 802 832 833  90 920 951 999 
    ##   6   2   5  38   3   2  10   6

``` r
  table(regen.data$origin)
```

    ## 
    ##   r   s   t   u 
    ## 135 639 142  10

``` r
  table(regen.data$radius.01)
```

    ## 
    ## 3.7 
    ## 926

``` r
  table(regen.data$radius.other)
```

    ## 
    ##   6 
    ## 926

``` r
#glimpse(regen.data)

skim(regen.data)
```

|                                                  |            |
| :----------------------------------------------- | :--------- |
| Name                                             | regen.data |
| Number of rows                                   | 926        |
| Number of columns                                | 17         |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| character                                        | 5          |
| numeric                                          | 12         |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: character**

| skim\_variable | n\_missing | complete\_rate | min | max | empty | n\_unique | whitespace |
| :------------- | ---------: | -------------: | --: | --: | ----: | --------: | ---------: |
| harvest        |          0 |              1 |   2 |   5 |     0 |         7 |          0 |
| date           |          0 |              1 |  10 |  10 |     0 |        38 |          0 |
| location       |          0 |              1 |   7 |   9 |     0 |         3 |          0 |
| spp            |          0 |              1 |   2 |   3 |     0 |        28 |          0 |
| origin         |          0 |              1 |   1 |   1 |     0 |         4 |          0 |

**Variable type: numeric**

| skim\_variable | n\_missing | complete\_rate |   mean |     sd |    p0 |   p25 |   p50 |   p75 |  p100 | hist  |
| :------------- | ---------: | -------------: | -----: | -----: | ----: | ----: | ----: | ----: | ----: | :---- |
| point          |          0 |           1.00 | 720.89 | 205.14 | 334.0 | 729.0 | 806.0 | 854.0 | 975.0 | ▃▁▁▇▅ |
| radius.01      |          0 |           1.00 |   3.70 |   0.00 |   3.7 |   3.7 |   3.7 |   3.7 |   3.7 | ▁▁▇▁▁ |
| radius.other   |          0 |           1.00 |   6.00 |   0.00 |   6.0 |   6.0 |   6.0 |   6.0 |   6.0 | ▁▁▇▁▁ |
| sup.seed01     |        582 |           0.37 |   2.86 |   4.02 |   1.0 |   1.0 |   1.0 |   3.0 |  35.0 | ▇▁▁▁▁ |
| sup.seed02     |        886 |           0.04 |   3.22 |   4.76 |   1.0 |   1.0 |   1.0 |   2.0 |  25.0 | ▇▁▁▁▁ |
| sup.seed03     |        926 |           0.00 |    NaN |     NA |    NA |    NA |    NA |    NA |    NA |       |
| sup.sapl       |        926 |           0.00 |    NaN |     NA |    NA |    NA |    NA |    NA |    NA |       |
| exp.seed01     |        417 |           0.55 |   3.78 |   6.34 |   1.0 |   1.0 |   2.0 |   4.0 |  97.0 | ▇▁▁▁▁ |
| exp.seed02     |        572 |           0.38 |   4.20 |   6.39 |   1.0 |   1.0 |   2.0 |   4.0 |  54.0 | ▇▁▁▁▁ |
| exp.seed03     |        855 |           0.08 |   3.75 |   4.70 |   1.0 |   1.0 |   2.0 |   4.0 |  31.0 | ▇▁▁▁▁ |
| exp.sapl       |        909 |           0.02 |   1.29 |   0.59 |   1.0 |   1.0 |   1.0 |   1.0 |   3.0 | ▇▁▂▁▁ |
| top4           |        581 |           0.37 |   2.15 |   1.20 |   1.0 |   1.0 |   2.0 |   3.0 |   4.0 | ▇▅▁▂▅ |

``` r
#str(regen.data)  there are xxxx rows in original data frame
head(regen.data)
```

    ## # A tibble: 6 x 17
    ##   harvest date  location point spp   origin radius.01 radius.other sup.seed01
    ##   <chr>   <chr> <chr>    <dbl> <chr> <chr>      <dbl>        <dbl>      <dbl>
    ## 1 boot    2020~ interior   356 001   u            3.7            6         NA
    ## 2 boot    2020~ interior   363 001   u            3.7            6         NA
    ## 3 boot    2020~ perimet~   950 001   u            3.7            6         NA
    ## 4 boot    2020~ perimet~   961 001   u            3.7            6         NA
    ## 5 cwb     2020~ control    398 001   u            3.7            6         NA
    ## 6 cwb     2020~ control    701 001   u            3.7            6         NA
    ## # ... with 8 more variables: sup.seed02 <dbl>, sup.seed03 <dbl>,
    ## #   sup.sapl <dbl>, exp.seed01 <dbl>, exp.seed02 <dbl>, exp.seed03 <dbl>,
    ## #   exp.sapl <dbl>, top4 <dbl>

``` r
#dim(regen.data)
```

### Convert plot seedling counts to per acre values by point

``` r
# convert seedling counts to per acre values
# 1. convert missing (NA) to 0 else density values inflated
# 2. multiple *.seed01 x 1000 (radius 3.7 ft). use mutate
# 3. multiple *. x (radius = 6) use mutate
# 4. aggregate into all suppressed and all exposed and top4 per acre for each point
# 5. subsequently, need to average points for final values per acre

regen.per.acre <- regen.data %>% 
  replace(is.na(.), 0) %>% 
  mutate(
    sup.seed01A = sup.seed01 * (43560 /((3.14156) * (3.7 * 3.7))),
    sup.seed02A = sup.seed01 * (43560 /((3.14156) * (6 * 6))),
    sup.seed03A = sup.seed01 * (43560 /((3.14156) * (6 * 6))),
    sup.saplA = sup.seed01 * (43560 /((3.14156) * (6 * 6))),
    exp.seed01A = sup.seed01 * (43560 /((3.14156) * (3.7 * 3.7))),
    exp.seed02A = sup.seed01 * (43560 /((3.14156) * (6 * 6))),
    exp.seed03A = sup.seed01 * (43560 /((3.14156) * (6 * 6))),
    exp.saplA = sup.seed01 * (43560 /((3.14156) * (6 * 6)))
  ) %>% 
  mutate(
    suppressed = sup.seed01A + sup.seed02A + sup.seed03A + sup.saplA,
    exposed = exp.seed01A + exp.seed02A + exp.seed03A + exp.saplA,
    top4A = top4 * exposed
  ) %>% 
  select(harvest, location, spp, origin, point, sup.seed01A, sup.seed02A, sup.seed03A, sup.saplA,
         exp.seed01A, exp.seed02A, exp.seed03A, exp.saplA, suppressed, exposed, top4A)
head(regen.per.acre)
```

    ## # A tibble: 6 x 16
    ##   harvest location spp   origin point sup.seed01A sup.seed02A sup.seed03A
    ##   <chr>   <chr>    <chr> <chr>  <dbl>       <dbl>       <dbl>       <dbl>
    ## 1 boot    interior 001   u        356           0           0           0
    ## 2 boot    interior 001   u        363           0           0           0
    ## 3 boot    perimet~ 001   u        950           0           0           0
    ## 4 boot    perimet~ 001   u        961           0           0           0
    ## 5 cwb     control  001   u        398           0           0           0
    ## 6 cwb     control  001   u        701           0           0           0
    ## # ... with 8 more variables: sup.saplA <dbl>, exp.seed01A <dbl>,
    ## #   exp.seed02A <dbl>, exp.seed03A <dbl>, exp.saplA <dbl>, suppressed <dbl>,
    ## #   exposed <dbl>, top4A <dbl>

``` r
table(regen.per.acre$spp)
```

    ## 
    ## 001 129 261 315 316 318 356 372 375 379 391 500 531 541 621 701 743 746 761 762 
    ##  10   1   1  26  87  34  62 125  27   2   8   2 115 105   3  10  89  20 104  23 
    ## 763 802 832 833  90 920 951 999 
    ##   6   2   5  38   3   2  10   6

``` r
view(regen.per.acre)
write.table(regen.per.acre, "regen-acre-expanded.txt", sep="\t")


# commercial regeneration species
# 316 318 372 541 621 762  802 832 833 951 
# 
# desirable diversity species (no interfering, includes Populus, paper birch, not pin cherry)
# 129 261 316 318 356 372 375 500 541 621 743 746 762 802 832 833  90 920 951
```

## DIVERSITY SPECIES

### calculate total seedling density for diversity species

``` r
# Calculate total seedling desity of desirable non-interfering species
# 1. filter undesired or interfering species
# 2. 
diversity.per.acre_point <- regen.per.acre %>% 
  filter(spp %in% c("129", "261", "316", "318", "356", "372", "375", "500", "541", "621", "743",
                    "746", "762", "802", "832", "833", "90", "920", "951")) %>% 
  group_by(harvest, location, point) %>% 
  summarise(
    per.acre_point.supp = sum(suppressed), #need to total all species within a point
    per.acre_point.exp = sum(exposed),
    per.acre_point.top4 = sum(top4A)
  )
```

    ## `summarise()` regrouping output by 'harvest', 'location' (override with `.groups` argument)

``` r
head(diversity.per.acre_point)
```

    ## # A tibble: 6 x 6
    ## # Groups:   harvest, location [1]
    ##   harvest location point per.acre_point.su~ per.acre_point.exp per.acre_point.t~
    ##   <chr>   <chr>    <dbl>              <dbl>              <dbl>             <dbl>
    ## 1 boot    interior   349             15178.             15178.                0 
    ## 2 boot    interior   350              4337.              4337.                0 
    ## 3 boot    interior   351                 0                  0                 0 
    ## 4 boot    interior   352              6505.              6505.                0 
    ## 5 boot    interior   353             10842.             10842.            32525.
    ## 6 boot    interior   354             10842.             10842.                0

``` r
write.table(diversity.per.acre_point, "diversity-acre-point.txt", sep="\t")


diversity.per.acre <- diversity.per.acre_point %>% 
  group_by(harvest, location) %>% 
  summarize(
    per.acre.supp = mean(per.acre_point.supp),
    per.acre.exp = mean(per.acre_point.exp),
    per.acre.top4 = mean(per.acre_point.top4)
  )
```

    ## `summarise()` regrouping output by 'harvest' (override with `.groups` argument)

``` r
head(diversity.per.acre)
```

    ## # A tibble: 6 x 5
    ## # Groups:   harvest [5]
    ##   harvest location  per.acre.supp per.acre.exp per.acre.top4
    ##   <chr>   <chr>             <dbl>        <dbl>         <dbl>
    ## 1 boot    interior         11412.       11412.         9130.
    ## 2 boot    perimeter         9674.        9674.         4170.
    ## 3 cgl     control           3903.        3903.         2602.
    ## 4 crp     control            929.         929.          232.
    ## 5 cwb     control           7434.        7434.        15101.
    ## 6 gl      interior          7076.        7076.         6163.

``` r
write.table(diversity.per.acre, "diversity-acre.txt", sep="\t")
```

## COMMERCIAL SPECIES

### calculate total seedling density for commercial species

``` r
# Calculate total seedling desity of desirable non-interfering species
# 1. filter undesired or interfering species
# 2. 

commercial.per.acre_point <- regen.per.acre %>% 
  filter(spp %in% c("316", "318",  "372", "541", "621",
                     "762", "802", "832", "833", "951")) %>% 
  group_by(harvest, location, point) %>% 
  summarise(
    per.acre_point.supp = sum(suppressed), #need to total all species within a point
    per.acre_point.exp01 = sum(exp.seed01A),
    per.acre_point.exp02 = sum(exp.seed02A),
    per.acre_point.exp03 = sum(exp.seed03A),
    per.acre_point.expsapl = sum(exp.saplA),
    per.acre_point.exp = sum(exposed),
    per.acre_point.top4 = sum(top4A)
  )
```

    ## `summarise()` regrouping output by 'harvest', 'location' (override with `.groups` argument)

``` r
head(commercial.per.acre_point)
```

    ## # A tibble: 6 x 10
    ## # Groups:   harvest, location [1]
    ##   harvest location point per.acre_point.~ per.acre_point.~ per.acre_point.~
    ##   <chr>   <chr>    <dbl>            <dbl>            <dbl>            <dbl>
    ## 1 boot    interior   349           15178.            7090.            2696.
    ## 2 boot    interior   350            4337.            2026.             770.
    ## 3 boot    interior   351               0                0                0 
    ## 4 boot    interior   352            6505.            3039.            1155.
    ## 5 boot    interior   353           10842.            5064.            1926.
    ## 6 boot    interior   354           10842.            5064.            1926.
    ## # ... with 4 more variables: per.acre_point.exp03 <dbl>,
    ## #   per.acre_point.expsapl <dbl>, per.acre_point.exp <dbl>,
    ## #   per.acre_point.top4 <dbl>

``` r
write.table(commercial.per.acre_point, "commercial-acre-point.txt", sep="\t")


commercial.per.acre <- commercial.per.acre_point %>% 
  group_by(harvest, location) %>% 
  summarize(
    per.acre.supp = mean(per.acre_point.supp),
    per.acre.exp01 = mean(per.acre_point.exp01),
    per.acre.exp02 = mean(per.acre_point.exp02),
    per.acre.exp03 = mean(per.acre_point.exp03),
    per.acre.expsapl = mean(per.acre_point.expsapl),
    per.acre.exp = mean(per.acre_point.exp),
    per.acre.top4 = mean(per.acre_point.top4)
  )
```

    ## `summarise()` regrouping output by 'harvest' (override with `.groups` argument)

``` r
head(commercial.per.acre)
```

    ## # A tibble: 6 x 9
    ## # Groups:   harvest [5]
    ##   harvest location per.acre.supp per.acre.exp01 per.acre.exp02 per.acre.exp03
    ##   <chr>   <chr>            <dbl>          <dbl>          <dbl>          <dbl>
    ## 1 boot    interior        11412.          5331.          2027.          2027.
    ## 2 boot    perimet~         9507.          4441.          1689.          1689.
    ## 3 cgl     control          3002.          1402.           533.           533.
    ## 4 crp     control           694.           324.           123.           123.
    ## 5 cwb     control          7357.          3436.          1307.          1307.
    ## 6 gl      interior         4337.          2026.           770.           770.
    ## # ... with 3 more variables: per.acre.expsapl <dbl>, per.acre.exp <dbl>,
    ## #   per.acre.top4 <dbl>

``` r
write.table(commercial.per.acre, "commercial-acre.txt", sep="\t")
```
