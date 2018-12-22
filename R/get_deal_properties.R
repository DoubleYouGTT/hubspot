#' Retrieve available properties for deals
#'
#' @inheritParams get_company_properties
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_deal_properties()
get_deal_properties <- function(apikey = "demo") {
  base_url <- "https://api.hubapi.com"
  properties_url <- httr::modify_url(base_url,
    path = "/properties/v1/deals/properties/"
  )
  res <- httr::GET(properties_url, query = list(hapikey = apikey))
  properties <- map_chr(httr::content(res), "name")

  return(properties)
}
