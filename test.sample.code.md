test of sample code
================

``` r
test.df <- read_csv("commercial-per-acre-point.csv", 
    col_types = cols(point = col_integer())) %>% 
  select(harvest, location, point, comm.per.acre_point.exp01, count)

  str(test.df)
```

    ## tibble [248 x 5] (S3: tbl_df/tbl/data.frame)
    ##  $ harvest                  : chr [1:248] "boot" "boot" "boot" "boot" ...
    ##  $ location                 : chr [1:248] "interior" "interior" "interior" "interior" ...
    ##  $ point                    : int [1:248] 349 350 351 352 353 354 355 357 358 359 ...
    ##  $ comm.per.acre_point.exp01: num [1:248] 2026 5064 9116 0 13167 ...
    ##  $ count                    : num [1:248] 1 1 1 1 1 1 1 1 1 1 ...

``` r
  print(test.df, n=20)
```

    ## # A tibble: 248 x 5
    ##    harvest location  point comm.per.acre_point.exp01 count
    ##    <chr>   <chr>     <int>                     <dbl> <dbl>
    ##  1 boot    interior    349                     2026.     1
    ##  2 boot    interior    350                     5064.     1
    ##  3 boot    interior    351                     9116.     1
    ##  4 boot    interior    352                        0      1
    ##  5 boot    interior    353                    13167.     1
    ##  6 boot    interior    354                        0      1
    ##  7 boot    interior    355                     7090.     1
    ##  8 boot    interior    357                        0      1
    ##  9 boot    interior    358                        0      1
    ## 10 boot    interior    359                        0      1
    ## 11 boot    interior    360                     2026.     1
    ## 12 boot    interior    361                     2026.     1
    ## 13 boot    interior    362                        0      1
    ## 14 boot    interior    364                     2026.     1
    ## 15 boot    interior    365                        0      1
    ## 16 boot    interior    366                     8103.     1
    ## 17 boot    interior    367                        0      1
    ## 18 boot    interior    368                     2026.     1
    ## 19 boot    interior    369                    27347.     1
    ## 20 boot    perimeter   951                    14180.     1
    ## # ... with 228 more rows
