
# codewhere

<!-- badges: start -->
  [![R-CMD-check](https://github.com/thisisnic/codewhere/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/thisisnic/codewhere/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->

The goal of codewhere is to help you find the location of the code associated with an R package.

## Installation

You can install the development version of codewhere from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("thisisnic/codewhere")
```

## Example

``` r
library(codewhere)
code_where("dplyr")
#> [1] "https://github.com/tidyverse/dplyr"
code_where("BiocVersion", package_type = "bioc")
#> [1] "https://code.bioconductor.org/browse/BiocVersion"
```

