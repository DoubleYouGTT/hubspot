#' Get a list of all deals, including a set of properties
#'
#' @inheritParams get_companies
#' @param associations Retrieve links to other entities
#'
#' @return List with deals data
#' @export
#' @family getters
#' @examples
#' deals <- get_deals(property_history = "false", max_iter = 1, max_properties = 10)
get_deals <- function(apikey = "demo",
                      properties = get_deal_properties(apikey),
                      property_history = "true",
                      associations = "true",
                      max_iter = 10,
                      max_properties = 100) {
  base_url <- "https://api.hubapi.com"
  properties_url <- httr::modify_url(base_url, path = "/deals/v1/deal/paged")
  properties <- head(properties, max_properties)
  deals <- list()
  n <- 0
  do <- TRUE
  offset <- 0

  while (do & n < max_iter) {
    res <- httr::GET(properties_url,
      query = c(
        list(
          offset = offset,
          hapikey = apikey,
          limit = 250,
          includeAssociations = associations,
          propertiesWithHistory = property_history
        ),
        set_names(
          lapply(properties, function(x) {
            x
          }),
          rep("properties", length(properties))
        )
      )
    )
    n <- n + 1
    res_content <- httr::content(res)
    deals[n] <- list(res_content$deals)
    do <- res_content$hasMore
    offset <- res_content$offset
  }

  deals <- flatten(deals)
  deals <- set_names(deals, map_int(deals, "dealId"))
}
