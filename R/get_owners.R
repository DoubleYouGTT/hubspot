#' Retrieve owners
#'
#' @inheritParams get_company_properties
#'
#' @return List of owners
#' @export
#' @family getters
#' @examples
#' owners <- get_owners()
get_owners <- function(apikey = hubspot_key_get()) {
  base_url <- "https://api.hubapi.com"
  users_url <- httr::modify_url(base_url, path = "/owners/v2/owners")
  res <- httr::GET(users_url, query = list(hapikey = apikey))
  owners <- httr::content(res)

  return(owners)
}
