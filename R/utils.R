#' API base URL
#' @return API base URL (character)
#' @noRd
base_url <- function() {
  "https://api.hubapi.com"
}

#' @param path An API endpoint path
#' @return The URL to that API endpoint (character)
#' @noRd
get_path_url <- function(path) {
  httr::modify_url(base_url(),
                   path = path
  )
}

#' @param path API endpoint path (character)
#' @param apikey API key (character)
#' @param query Query parameters (named list)
#' @return A list
#' @noRd
get_results <- function(path, apikey,
                        query = NULL) {

  query$hapikey <- apikey

  httr::GET(get_path_url(path),
            query = query,
            httr::user_agent("hubspot R package by Locke Data")) %>%
    httr::content()
}

#' @param path API endpoint path (character)
#' @param apikey API key (character)
#' @param query Query parameters (named list)
#' @param max_iter Maximal number of iterations (integer)
#' @param element Element to retrieve from API raw results (character)
#' @param hasmore_name Name of the has-more parameter for the API endpoint (character)
#' @return A list
#' @noRd
get_results_paged <- function(path, apikey, query = NULL,
                              max_iter = max_iter, element,
                              hasmore_name) {
  results <- list()
  n <- 0
  do <- TRUE
  offset <- 0

  while (do & n < max_iter) {
    query$offset <- offset

    res_content <- get_results(path = path,
                      apikey = apikey, query = query)
    n <- n + 1

    results[n] <- list(res_content[[element]])
    do <- res_content[[hasmore_name]]
    offset <- res_content$offset
  }

  results <- purrr::flatten(results)

  return(results)
}
