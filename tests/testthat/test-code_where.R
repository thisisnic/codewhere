with_mock_dir("cran_tests", {
  test_that("code_where can extract package URL for CRAN packages", {
    expect_equal(code_where("dplyr"), "https://github.com/tidyverse/dplyr")
    expect_null(code_where("madeuppkgname"))
    expect_null(code_where("RobinCar"))
  })
})

with_mock_dir("bioc_tests", {
  test_that("code_where can extract package URL for Bioconductor packages", {
    expect_equal(code_where("GenomicFeatures", package_type = "bioc"), "https://code.bioconductor.org/browse/GenomicFeatures")
  })
})

with_mock_dir("gh_tests", {
  test_that("code_where can extract package URL for GitHub packages", {
    expect_equal(code_where("tidyverse/dplyr", package_type = "github"), "https://github.com/tidyverse/dplyr")
    expect_warning(code_where("tidyverse/madeupreponame", package_type = "github"), regexp = "could not be reached")
    expect_warning(
      code_where("tidyverse/madeupreponame/badformat", package_type = "github"),
      regexp = "Could not parse GitHub package name"
    )
  })
})
