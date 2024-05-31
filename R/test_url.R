#' Tests if a URL can be accessed; raises a warning if not
#'
#' @param url URL to test
#' @noRd
test_url <- function(url){

  url_exists <- FALSE

  tryCatch(
    {
      result <- GET(url)
      connection_success <- result$status_code==200
      if(connection_success){
        url_exists <- TRUE
      }
      else{
        warn_connection_failure(url)
      }
    },
    error = function(e){
      if(grepl("Could not resolve host", e)){
        warn_connection_failure(url)
      } else {
        e
      }
    }
  )

  return(url_exists)
}

warn_connection_failure <- function(url){
  warning(paste0("URL ", url, " could not be reached"), call. = FALSE)
}
