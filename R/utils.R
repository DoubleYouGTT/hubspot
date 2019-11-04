base_url <- function() {
  "https://api.hubapi.com"
}

get_path_url <- function(path) {
  httr::modify_url(base_url(),
                   path = path
  )
}

get_results <- function(path, apikey, query = NULL) {

  query$hapikey <- apikey

  httr::GET(get_path_url(path),
            query = query,
            httr::user_agent("hubspot R package by Locke Data"))
}

get_results_paged <- function(path, apikey, query = NULL,
                              max_iter = max_iter, element,
                              hasmore_name) {
  results <- list()
  n <- 0
  do <- TRUE
  offset <- 0

  while (do & n < max_iter) {
    query$offset <- offset

    res <- get_results(path = path,
                      apikey = apikey, query = query)
    n <- n + 1
    res_content <- httr::content(res)

    results[n] <- list(res_content[[element]])
    do <- res_content[[hasmore_name]]
    offset <- res_content$offset
  }

  results <- purrr::flatten(results)

  return(results)
}
