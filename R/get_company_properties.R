#' Retrieve available properties for companies
#'
#' @param apikey API key to work with Hubspot
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' get_company_properties()
get_company_properties <- function(apikey = "demo") {
  base_url <- "https://api.hubapi.com"
  properties_url <- httr::modify_url(base_url,
    path = "/properties/v1/companies/properties/"
  )
  res <- httr::GET(properties_url, query = list(hapikey = apikey))
  properties <- map_chr(httr::content(res), "name")

  return(properties)
}
