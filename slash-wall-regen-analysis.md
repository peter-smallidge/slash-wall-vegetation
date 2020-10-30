Regneration Analysis
================
Peter Smallidge
10/17/2020

### Analysis of regeneation plot data - 2019

### read data from csv file, check variables and data structure

<!-- note to self: in the "read_csv" code, after the file location the code
for 'col..." etc ensures that the specified column is adjusted to correct data type
the file "cheat sheet data-import" has details -->

``` r
input.data <- read_csv("~/R/slash-wall-vegetation/regen-data-2019.csv",
                      col_types=cols(spp=col_character(), 
                                     sup.seed03=col_number(),
                                     sup.sapl=col_number(),
                                     point=col_character()))
str(input.data)
```

    ## tibble [927 x 18] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ harvest     : chr [1:927] "boot" "boot" "boot" "boot" ...
    ##  $ date        : chr [1:927] "2020.06.19" "2020.06.15" "2020.06.17" "2020.06.22" ...
    ##  $ location    : chr [1:927] "interior" "interior" "perimeter" "perimeter" ...
    ##  $ point       : chr [1:927] "356" "363" "950" "961" ...
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
    ##   ..   point = col_character(),
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
plot.data <- read_csv("~/R/slash-wall-vegetation/plot-data-2019.csv",
                              col_types = cols(point=col_character(),
                                              upper_spp=col_character(),
                                               baf=col_number(),
                                              oakhick=col_number(),
                                              beech=col_number(),
                                              maple=col_number(),
                                              birch=col_number(),
                                              hdwd=col_number(),
                                              conifer=col_number(),
                                              ba=col_number()
                                              ))
str(plot.data) # there are 248 plots in 2019 data
```

    ## tibble [248 x 28] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
    ##  $ harvest      : chr [1:248] "boot" "boot" "boot" "boot" ...
    ##  $ season       : num [1:248] 2019 2019 2019 2019 2019 ...
    ##  $ date         : chr [1:248] "2020.06.16" "2020.06.16" "2020.06.17" "2020.06.22" ...
    ##  $ location     : chr [1:248] "interior" "interior" "interior" "interior" ...
    ##  $ point        : chr [1:248] "349" "350" "351" "352" ...
    ##  $ disturb      : chr [1:248] "l" "m" "a" "m" ...
    ##  $ slash        : chr [1:248] "p" "p" "m" "m" ...
    ##  $ fern         : chr [1:248] "a" "m" "a" "l" ...
    ##  $ herb         : chr [1:248] "m" "l" "p" "p" ...
    ##  $ low_cov      : chr [1:248] "h" "h" "m" "h" ...
    ##  $ low_spp      : chr [1:248] "rubu" "rubu" "rubu" "rubu" ...
    ##  $ invasive_cov : chr [1:248] "p" "a" "a" "a" ...
    ##  $ invasive_spp : chr [1:248] "loni" NA NA NA ...
    ##  $ mid_cov      : chr [1:248] "p" "p" "m" "p" ...
    ##  $ mid_spp      : chr [1:248] "761" "761" "531" "372" ...
    ##  $ upper_cov    : chr [1:248] "l" "p" "m" "l" ...
    ##  $ upper_spp    : chr [1:248] "318" "531" "531" "318" ...
    ##  $ vine_cov     : chr [1:248] "a" "a" "a" "a" ...
    ##  $ vine_spp     : chr [1:248] NA NA NA NA ...
    ##  $ baf          : num [1:248] 10 10 10 10 10 10 10 10 10 10 ...
    ##  $ oakhick      : num [1:248] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ beech        : num [1:248] NA 1 1 NA NA NA NA NA NA NA ...
    ##  $ maple        : num [1:248] 2 NA 2 3 5 3 NA 4 3 2 ...
    ##  $ birch        : num [1:248] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ hdwd         : num [1:248] NA NA NA NA 1 NA NA NA NA NA ...
    ##  $ conifer      : num [1:248] NA NA NA NA NA NA NA NA NA NA ...
    ##  $ ba           : num [1:248] 20 10 30 30 60 30 0 40 30 20 ...
    ##  $ seedling-numb: num [1:248] 100 50 100 100 25 10 100 10 0 10 ...
    ##  - attr(*, "spec")=
    ##   .. cols(
    ##   ..   harvest = col_character(),
    ##   ..   season = col_double(),
    ##   ..   date = col_character(),
    ##   ..   location = col_character(),
    ##   ..   point = col_character(),
    ##   ..   disturb = col_character(),
    ##   ..   slash = col_character(),
    ##   ..   fern = col_character(),
    ##   ..   herb = col_character(),
    ##   ..   low_cov = col_character(),
    ##   ..   low_spp = col_character(),
    ##   ..   invasive_cov = col_character(),
    ##   ..   invasive_spp = col_character(),
    ##   ..   mid_cov = col_character(),
    ##   ..   mid_spp = col_character(),
    ##   ..   upper_cov = col_character(),
    ##   ..   upper_spp = col_character(),
    ##   ..   vine_cov = col_character(),
    ##   ..   vine_spp = col_character(),
    ##   ..   baf = col_number(),
    ##   ..   oakhick = col_number(),
    ##   ..   beech = col_number(),
    ##   ..   maple = col_number(),
    ##   ..   birch = col_number(),
    ##   ..   hdwd = col_number(),
    ##   ..   conifer = col_number(),
    ##   ..   ba = col_number(),
    ##   ..   `seedling-numb` = col_double()
    ##   .. )

``` r
regen.data <- input.data %>% 
  select(-other) %>%  # removes the column for "other"
  filter(!spp == "ush") %>%   #removes the row where species = "ush"
  replace(is.na(.), 0) %>% 
  arrange(harvest, location, point, spp) %>% 
  print(n=15)
```

    ## # A tibble: 926 x 17
    ##    harvest date  location point spp   origin radius.01 radius.other sup.seed01
    ##    <chr>   <chr> <chr>    <chr> <chr> <chr>      <dbl>        <dbl>      <dbl>
    ##  1 boot    2020~ interior 349   372   s            3.7            6          7
    ##  2 boot    2020~ interior 349   541   s            3.7            6          0
    ##  3 boot    2020~ interior 350   316   s            3.7            6          1
    ##  4 boot    2020~ interior 350   372   s            3.7            6          0
    ##  5 boot    2020~ interior 350   531   r            3.7            6          0
    ##  6 boot    2020~ interior 350   541   s            3.7            6          1
    ##  7 boot    2020~ interior 350   761   s            3.7            6          0
    ##  8 boot    2020~ interior 351   372   s            3.7            6          0
    ##  9 boot    2020~ interior 352   315   s            3.7            6          1
    ## 10 boot    2020~ interior 352   316   s            3.7            6          3
    ## 11 boot    2020~ interior 352   372   s            3.7            6          0
    ## 12 boot    2020~ interior 353   372   s            3.7            6          5
    ## 13 boot    2020~ interior 353   746   s            3.7            6          0
    ## 14 boot    2020~ interior 354   372   s            3.7            6          5
    ## 15 boot    2020~ interior 355   316   s            3.7            6         14
    ## # ... with 911 more rows, and 8 more variables: sup.seed02 <dbl>,
    ## #   sup.seed03 <dbl>, sup.sapl <dbl>, exp.seed01 <dbl>, exp.seed02 <dbl>,
    ## #   exp.seed03 <dbl>, exp.sapl <dbl>, top4 <dbl>

``` r
#str(regen.data)
unique(regen.data$point)  # n=242 points with seedlings from 2019 field data
```

    ##   [1] "349" "350" "351" "352" "353" "354" "355" "356" "357" "358" "359" "360"
    ##  [13] "361" "362" "363" "364" "365" "366" "367" "368" "369" "950" "951" "952"
    ##  [25] "953" "954" "955" "956" "957" "958" "959" "960" "961" "962" "963" "964"
    ##  [37] "965" "729" "730" "731" "732" "733" "734" "735" "736" "737" "738" "739"
    ##  [49] "740" "742" "743" "744" "745" "746" "747" "748" "750" "752" "753" "754"
    ##  [61] "755" "756" "757" "758" "759" "760" "761" "762" "763" "764" "765" "766"
    ##  [73] "767" "768" "769" "770" "771" "772" "773" "774" "775" "384" "385" "386"
    ##  [85] "387" "388" "389" "390" "391" "392" "393" "394" "395" "396" "397" "398"
    ##  [97] "399" "400" "701" "702" "703" "704" "705" "706" "707" "708" "709" "710"
    ## [109] "711" "712" "713" "946" "947" "948" "949" "836" "837" "838" "839" "840"
    ## [121] "841" "842" "843" "844" "845" "846" "847" "848" "849" "850" "851" "852"
    ## [133] "853" "854" "855" "857" "858" "859" "860" "861" "862" "863" "864" "865"
    ## [145] "866" "867" "868" "869" "870" "871" "872" "875" "876" "877" "878" "879"
    ## [157] "801" "802" "803" "804" "805" "806" "807" "808" "809" "810" "811" "812"
    ## [169] "813" "815" "816" "817" "818" "819" "820" "821" "822" "823" "824" "825"
    ## [181] "826" "827" "828" "829" "830" "831" "832" "833" "834" "835" "334" "335"
    ## [193] "336" "337" "338" "339" "340" "341" "342" "343" "344" "345" "346" "347"
    ## [205] "348" "880" "881" "882" "883" "884" "885" "886" "887" "888" "889" "890"
    ## [217] "891" "892" "370" "371" "372" "373" "374" "375" "376" "377" "378" "379"
    ## [229] "380" "381" "382" "383" "966" "967" "968" "969" "970" "971" "972" "973"
    ## [241] "974" "975"

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
  table(regen.data$origin) # origin = "u" = spp = 001 = empty seedling plot
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
| character                                        | 6          |
| numeric                                          | 11         |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: character**

| skim\_variable | n\_missing | complete\_rate | min | max | empty | n\_unique | whitespace |
| :------------- | ---------: | -------------: | --: | --: | ----: | --------: | ---------: |
| harvest        |          0 |              1 |   2 |   5 |     0 |         7 |          0 |
| date           |          0 |              1 |  10 |  10 |     0 |        38 |          0 |
| location       |          0 |              1 |   7 |   9 |     0 |         3 |          0 |
| point          |          0 |              1 |   3 |   3 |     0 |       242 |          0 |
| spp            |          0 |              1 |   2 |   3 |     0 |        28 |          0 |
| origin         |          0 |              1 |   1 |   1 |     0 |         4 |          0 |

**Variable type: numeric**

| skim\_variable | n\_missing | complete\_rate | mean |   sd |  p0 | p25 | p50 | p75 | p100 | hist  |
| :------------- | ---------: | -------------: | ---: | ---: | --: | --: | --: | --: | ---: | :---- |
| radius.01      |          0 |              1 | 3.70 | 0.00 | 3.7 | 3.7 | 3.7 | 3.7 |  3.7 | ▁▁▇▁▁ |
| radius.other   |          0 |              1 | 6.00 | 0.00 | 6.0 | 6.0 | 6.0 | 6.0 |  6.0 | ▁▁▇▁▁ |
| sup.seed01     |          0 |              1 | 1.06 | 2.81 | 0.0 | 0.0 | 0.0 | 1.0 | 35.0 | ▇▁▁▁▁ |
| sup.seed02     |          0 |              1 | 0.14 | 1.18 | 0.0 | 0.0 | 0.0 | 0.0 | 25.0 | ▇▁▁▁▁ |
| sup.seed03     |          0 |              1 | 0.00 | 0.00 | 0.0 | 0.0 | 0.0 | 0.0 |  0.0 | ▁▁▇▁▁ |
| sup.sapl       |          0 |              1 | 0.00 | 0.00 | 0.0 | 0.0 | 0.0 | 0.0 |  0.0 | ▁▁▇▁▁ |
| exp.seed01     |          0 |              1 | 2.08 | 5.06 | 0.0 | 0.0 | 1.0 | 2.0 | 97.0 | ▇▁▁▁▁ |
| exp.seed02     |          0 |              1 | 1.60 | 4.44 | 0.0 | 0.0 | 0.0 | 1.0 | 54.0 | ▇▁▁▁▁ |
| exp.seed03     |          0 |              1 | 0.29 | 1.63 | 0.0 | 0.0 | 0.0 | 0.0 | 31.0 | ▇▁▁▁▁ |
| exp.sapl       |          0 |              1 | 0.02 | 0.19 | 0.0 | 0.0 | 0.0 | 0.0 |  3.0 | ▇▁▁▁▁ |
| top4           |          0 |              1 | 0.80 | 1.27 | 0.0 | 0.0 | 0.0 | 1.0 |  4.0 | ▇▂▁▁▁ |

``` r
#str(regen.data)  there are xxxx rows in original data frame
head(regen.data)
```

    ## # A tibble: 6 x 17
    ##   harvest date  location point spp   origin radius.01 radius.other sup.seed01
    ##   <chr>   <chr> <chr>    <chr> <chr> <chr>      <dbl>        <dbl>      <dbl>
    ## 1 boot    2020~ interior 349   372   s            3.7            6          7
    ## 2 boot    2020~ interior 349   541   s            3.7            6          0
    ## 3 boot    2020~ interior 350   316   s            3.7            6          1
    ## 4 boot    2020~ interior 350   372   s            3.7            6          0
    ## 5 boot    2020~ interior 350   531   r            3.7            6          0
    ## 6 boot    2020~ interior 350   541   s            3.7            6          1
    ## # ... with 8 more variables: sup.seed02 <dbl>, sup.seed03 <dbl>,
    ## #   sup.sapl <dbl>, exp.seed01 <dbl>, exp.seed02 <dbl>, exp.seed03 <dbl>,
    ## #   exp.sapl <dbl>, top4 <dbl>

``` r
#dim(regen.data)
```

### Create tibble of the count of points

``` r
point.count <-  plot.data %>% # create variable for total plots for denominator of average density
  group_by(harvest, location, point) %>% 
  summarize(n =n()) %>% 
  mutate(count = n/n) %>% 
  select(harvest, location, point, count) 
```

    ## `summarise()` regrouping output by 'harvest', 'location' (override with `.groups` argument)

``` r
dim(point.count) # n=248 unique points
```

    ## [1] 248   4

``` r
head(point.count,n=10L) 
```

    ## # A tibble: 10 x 4
    ## # Groups:   harvest, location [1]
    ##    harvest location point count
    ##    <chr>   <chr>    <chr> <dbl>
    ##  1 boot    interior 349       1
    ##  2 boot    interior 350       1
    ##  3 boot    interior 351       1
    ##  4 boot    interior 352       1
    ##  5 boot    interior 353       1
    ##  6 boot    interior 354       1
    ##  7 boot    interior 355       1
    ##  8 boot    interior 356       1
    ##  9 boot    interior 357       1
    ## 10 boot    interior 358       1

### Convert plot seedling counts to per acre values by plot (var=point)

``` r
# convert seedling counts to per acre values, data resolution for species by plot
# 1. convert missing (NA) to 0 else density values inflated (completed in previous chunk)
# 2. multiple *.seed01 x 1000 (radius 3.7 ft). use mutate
# 3. multiple *. x (radius = 6) use mutate
# 4. aggregate into "all suppressed" and "all exposed" and top4 per acre for each point
# 5. subsequently, need to average points for final values per acre

regen.per.acre <- regen.data %>% 
     mutate(
    sup.seed01A = sup.seed01 * (43560 /((3.14156) * (3.7 * 3.7))),
    sup.seed02A = sup.seed02 * (43560 /((3.14156) * (6 * 6))),
    sup.seed03A = sup.seed03 * (43560 /((3.14156) * (6 * 6))),
    sup.saplA = sup.sapl * (43560 /((3.14156) * (6 * 6))),
    exp.seed01A = exp.seed01 * (43560 /((3.14156) * (3.7 * 3.7))),
    exp.seed02A = exp.seed02 * (43560 /((3.14156) * (6 * 6))),
    exp.seed03A = exp.seed03 * (43560 /((3.14156) * (6 * 6))),
    exp.saplA = exp.sapl * (43560 /((3.14156) * (6 * 6)))
  ) %>% 
  mutate(
    suppressed = sup.seed01A + sup.seed02A + sup.seed03A + sup.saplA,
    exposed = exp.seed01A + exp.seed02A + exp.seed03A + exp.saplA,
    top4A = top4 * (43560 /((3.14156) * (6 * 6))) 
  ) %>% 
  select(harvest, location, point, spp, origin, sup.seed01A, sup.seed02A, sup.seed03A, sup.saplA,
         exp.seed01A, exp.seed02A, exp.seed03A, exp.saplA, suppressed, exposed, top4A)

regen.per.acre %>% 
  arrange(harvest, location, point, spp) %>% 
  head(n=15L)
```

    ## # A tibble: 15 x 16
    ##    harvest location point spp   origin sup.seed01A sup.seed02A sup.seed03A
    ##    <chr>   <chr>    <chr> <chr> <chr>        <dbl>       <dbl>       <dbl>
    ##  1 boot    interior 349   372   s            7090.           0           0
    ##  2 boot    interior 349   541   s               0            0           0
    ##  3 boot    interior 350   316   s            1013.           0           0
    ##  4 boot    interior 350   372   s               0            0           0
    ##  5 boot    interior 350   531   r               0            0           0
    ##  6 boot    interior 350   541   s            1013.           0           0
    ##  7 boot    interior 350   761   s               0            0           0
    ##  8 boot    interior 351   372   s               0            0           0
    ##  9 boot    interior 352   315   s            1013.           0           0
    ## 10 boot    interior 352   316   s            3039.           0           0
    ## 11 boot    interior 352   372   s               0            0           0
    ## 12 boot    interior 353   372   s            5064.           0           0
    ## 13 boot    interior 353   746   s               0            0           0
    ## 14 boot    interior 354   372   s            5064.           0           0
    ## 15 boot    interior 355   316   s           14180.           0           0
    ## # ... with 8 more variables: sup.saplA <dbl>, exp.seed01A <dbl>,
    ## #   exp.seed02A <dbl>, exp.seed03A <dbl>, exp.saplA <dbl>, suppressed <dbl>,
    ## #   exposed <dbl>, top4A <dbl>

``` r
dim(regen.per.acre)
```

    ## [1] 926  16

``` r
table(regen.per.acre$spp)
```

    ## 
    ## 001 129 261 315 316 318 356 372 375 379 391 500 531 541 621 701 743 746 761 762 
    ##  10   1   1  26  87  34  62 125  27   2   8   2 115 105   3  10  89  20 104  23 
    ## 763 802 832 833  90 920 951 999 
    ##   6   2   5  38   3   2  10   6

``` r
#view(regen.per.acre)
#write.table(regen.per.acre, "regen-acre-expanded.txt", sep="\t")

regen.per.acre %>% 
  write_csv(path = "regen-acre-expanded.csv") 
```

    ## Warning: The `path` argument of `write_csv()` is deprecated as of readr 1.4.0.
    ## Please use the `file` argument instead.
    ## This warning is displayed once every 8 hours.
    ## Call `lifecycle::last_warnings()` to see where this warning was generated.

``` r
#this path places file into the current directory
#the data include per acre density by species by point by location by harvest

###   calculations were confirmed for boot>interior>#350 and #355


# commercial regeneration species
# 316 318 372 541 621 762  802 832 833 951 
# 
# desirable diversity species (no interfering, but includes Populus, paper birch, not pin cherry)
# 129 261 316 318 356 372 375 500 541 621 743 746 762 802 832 833  90 920 951
```

## DIVERSITY SPECIES

### calculate total seedling density for “diversity” species

#### diversity species include: spr, ewp, hem, rem, sum, serv, swb, pab, hawt, wha, yep, bta, qua, blc, oaks, willow, bassw

``` r
# Calculate total seedling desity of desirable non-interfering species
# 1. filter undesired or interfering species to retain species of "diversity value"
# 2. calculate density
diversity.per.acre_point <- regen.per.acre %>% 
  filter(spp %in% c("001", "29", "261", "316", "318", "356", "372", "375", "500", "541", "621", "743",
                    "746", "762", "802", "832", "833", "90", "920", "951")) %>% 
  group_by(harvest, location, point) %>% 
  summarise(
    per.acre_point.supp = sum(suppressed), #need to total all species within a point
    per.acre_point.exp = sum(exposed),
    per.acre_point.top4 = sum(top4A)
  )%>% 
  full_join(point.count, by = c("harvest",  "location",  "point")) %>% 
  replace(is.na(.), 0)
```

    ## `summarise()` regrouping output by 'harvest', 'location' (override with `.groups` argument)

``` r
# use "full_join" because plots with no diversity species have been removed from df = diversity.per.acre_point. Replace na=0 ensures accurate calculation of mean stem count per acre.

dim(diversity.per.acre_point)
```

    ## [1] 248   7

``` r
head(diversity.per.acre_point, n=10L)
```

    ## # A tibble: 10 x 7
    ## # Groups:   harvest, location [1]
    ##    harvest location point per.acre_point.~ per.acre_point.~ per.acre_point.~
    ##    <chr>   <chr>    <chr>            <dbl>            <dbl>            <dbl>
    ##  1 boot    interior 349              7090.            2026.             385.
    ##  2 boot    interior 350              2026.            5064.               0 
    ##  3 boot    interior 351                 0             9116.               0 
    ##  4 boot    interior 352              3039.             385.               0 
    ##  5 boot    interior 353              5064.           14180.            1541.
    ##  6 boot    interior 354              5064.               0                0 
    ##  7 boot    interior 355             17218.            8630.               0 
    ##  8 boot    interior 356                 0                0                0 
    ##  9 boot    interior 357              1013.             385.             385.
    ## 10 boot    interior 358              1013.               0                0 
    ## # ... with 1 more variable: count <dbl>

``` r
diversity.per.acre_point %>% 
write_csv(path = "diversity-acre-point.csv") # n=248 points

###   calculations at point-level were confirmed 10/29/2020 for boot>interior>#350, #355 and #361



diversity_per_acre <- diversity.per.acre_point %>% 
  group_by(harvest, location) %>% 
  summarize(
    div.per.acre.supp = sum(per.acre_point.supp) / sum(count),
    div.per.acre.exp = sum(per.acre_point.exp) / sum(count),
    div.per.acre.top4 = sum(per.acre_point.top4) / sum(count)
  ) 
```

    ## `summarise()` regrouping output by 'harvest' (override with `.groups` argument)

``` r
head(diversity_per_acre, n=15L)
```

    ## # A tibble: 11 x 5
    ## # Groups:   harvest [7]
    ##    harvest location  div.per.acre.supp div.per.acre.exp div.per.acre.top4
    ##    <chr>   <chr>                 <dbl>            <dbl>             <dbl>
    ##  1 boot    interior              4823.            4299.              422.
    ##  2 boot    perimeter             3672.            5763.              241.
    ##  3 cgl     control               1609.           11410.              657.
    ##  4 crp     control                419.            7033.              677.
    ##  5 cwb     control               2860.            5341.              680.
    ##  6 gl      interior              2933.            4879.              788.
    ##  7 gl      perimeter             4656.            7858.              990.
    ##  8 rp      interior              3594.           16629.             1078.
    ##  9 rp      perimeter             4189.            8641.              770.
    ## 10 wedge   interior              2098.           10117.              303.
    ## 11 wedge   perimeter             2836.            4696.              616.

``` r
diversity_per_acre %>% 
  write_csv(path = "diversity-per-acre.csv")
#calculations confirmed 10/30/2020 for boot interior and wedge interior
```

## COMMERCIAL SPECIES

### calculate total seedling density for commercial species

#### diversity species include: rem, sum, swb, wha, yep,blc, oaks,bassw

``` r
# Calculate total seedling desity of desirable non-interfering species
# 1. filter undesired or interfering species
# 2. 

commercial.per.acre_point <- regen.per.acre %>% 
  filter(spp %in% c("316", "318",  "372", "541", "621",
                     "762", "802", "832", "833", "951")) %>% 
  group_by(harvest, location, point) %>% 
  summarise(
    comm.per.acre_point.supp = sum(suppressed), #total all commercial species within a point
    comm.per.acre_point.exp01 = sum(exp.seed01A),
    comm.per.acre_point.exp02 = sum(exp.seed02A),
    comm.per.acre_point.exp03 = sum(exp.seed03A),
    comm.per.acre_point.expsapl = sum(exp.saplA),
    comm.per.acre_point.exp = sum(exposed),
    comm.per.acre_point.top4 = sum(top4A)
  )%>% 
  full_join(point.count, by = c("harvest",  "location",  "point")) %>% 
  replace(is.na(.), 0)
```

    ## `summarise()` regrouping output by 'harvest', 'location' (override with `.groups` argument)

``` r
commercial.per.acre_point %>% 
  arrange(harvest, location, point) %>% 
  head(n=10L)
```

    ## # A tibble: 10 x 11
    ## # Groups:   harvest, location [1]
    ##    harvest location point comm.per.acre_p~ comm.per.acre_p~ comm.per.acre_p~
    ##    <chr>   <chr>    <chr>            <dbl>            <dbl>            <dbl>
    ##  1 boot    interior 349              7090.            2026.               0 
    ##  2 boot    interior 350              2026.            5064.               0 
    ##  3 boot    interior 351                 0             9116.               0 
    ##  4 boot    interior 352              3039.               0              385.
    ##  5 boot    interior 353              5064.           13167.               0 
    ##  6 boot    interior 354              5064.               0                0 
    ##  7 boot    interior 355             17218.            7090.            1541.
    ##  8 boot    interior 356                 0                0                0 
    ##  9 boot    interior 357              1013.               0              385.
    ## 10 boot    interior 358              1013.               0                0 
    ## # ... with 5 more variables: comm.per.acre_point.exp03 <dbl>,
    ## #   comm.per.acre_point.expsapl <dbl>, comm.per.acre_point.exp <dbl>,
    ## #   comm.per.acre_point.top4 <dbl>, count <dbl>

``` r
# points without commercial species have value = "0"
# 

commercial.per.acre_point %>% 
  write_csv(path = "commercial-per-acre-point.csv")  # allows for confirmation of calculations

# OLD format ...write.table(commercial.per.acre_point, "commercial-acre-point.txt", sep="\t")


commercial.per.acre <- commercial.per.acre_point %>% 
  group_by(harvest, location) %>% 
  summarize(
    comm.per.acre.supp = mean(comm.per.acre_point.supp),
    comm.per.acre.exp01 = mean(comm.per.acre_point.exp01),
    comm.per.acre.exp02 = mean(comm.per.acre_point.exp02),
    comm.per.acre.exp03 = mean(comm.per.acre_point.exp03),
    comm.per.acre.expsapl = mean(comm.per.acre_point.expsapl),
    comm.per.acre.exp = mean(comm.per.acre_point.exp),
    comm.per.acre.top4 = mean(comm.per.acre_point.top4)
  )
```

    ## `summarise()` regrouping output by 'harvest' (override with `.groups` argument)

``` r
head(commercial.per.acre, n=15L)
```

    ## # A tibble: 11 x 9
    ## # Groups:   harvest [7]
    ##    harvest location comm.per.acre.s~ comm.per.acre.e~ comm.per.acre.e~
    ##    <chr>   <chr>               <dbl>            <dbl>            <dbl>
    ##  1 boot    interior            4823.            3810.            440. 
    ##  2 boot    perimet~            3608.            5317.            169. 
    ##  3 cgl     control             1072.            8460.            272. 
    ##  4 crp     control              279.            3213.             26.6
    ##  5 cwb     control             2830.            5243.             45.3
    ##  6 gl      interior            1721.            1496.           1339. 
    ##  7 gl      perimet~            3094.            2170.           1860. 
    ##  8 rp      interior            1756.            9656.            616. 
    ##  9 rp      perimet~            1714.            2104.            593. 
    ## 10 wedge   interior            2026.            9550.            110. 
    ## 11 wedge   perimet~            2836.            2836.            193. 
    ## # ... with 4 more variables: comm.per.acre.exp03 <dbl>,
    ## #   comm.per.acre.expsapl <dbl>, comm.per.acre.exp <dbl>,
    ## #   comm.per.acre.top4 <dbl>

``` r
commercial.per.acre %>% 
  write_csv(path = "commercial-per-acre.csv") # data desired for description of treatments

# OLD format...write.table(commercial.per.acre, "commercial-acre.txt", sep="\t")
```
