#' Find a package's code
#'
#' @param package_name The name of the package
#' @param package_type One of "cran", "bioc", or "github"
#' @export
#' @return Path to where code can be found or NULL
#' @examples
#' code_where("dplyr")
code_where <- function(package_name, package_type = "cran") {
  match.arg(package_type, c("cran", "bioc", "github"))

  if (package_type == "cran") {
    url <- extract_url_cran(package_name)
  } else if (package_type == "bioc") {
    url <- extract_bioc_url(package_name)
  } else if (package_type == "github") {
    url <- extract_github_url(package_name)
  }

  if (test_url(url)) {
    return(url)
  }
}
