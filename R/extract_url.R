#' @import httr
extract_url_cran <- function(package_name){
  cran_description_url <- paste0("https://cran.r-project.org/web/packages/", package_name, "/DESCRIPTION")
  response <- GET(cran_description_url)

  # Check if the package exists on CRAN
  if (response$status_code != 200) {
    return()
  }

  # Parse DESCRIPTION file
  description <- content(response, "text", encoding = "utf8")

  # Extract the URL field from the DESCRIPTION file
  desc_by_line <- strsplit(description, "\n")[[1]]

  url_line <- grepl("^URL", desc_by_line)

  if(!any(url_line)){
    return()
  }

  url_line <- desc_by_line[url_line]
  url_line <- gsub("^URL:", "", url_line)
  urls <- trimws(strsplit(url_line, ",")[[1]])

  gh_urls <- grepl("github.com|gitlab.com", urls)

  if(any(gh_urls)){
    return(urls[gh_urls])
  }
}

extract_bioc_url <- function(package_name){
  paste0("https://code.bioconductor.org/browse/", package_name)
}

extract_github_url <- function(package_name){
  if(!check_repo_format(package_name)){
    warning(
      paste0(
        "Could not parse GitHub package name `",
        package_name ,
        "`.\nGitHub package name should be supplied in format <owner>/<repo>"
      ),
      call.=FALSE
    )
  }
  else{
    return(paste0("https://github.com/", package_name))
  }
}

check_repo_format <- function(x){
  grepl("^[a-zA-Z0-9-]+(?<!-)/[a-zA-Z0-9-_]+$", x, perl = TRUE)
}
