#' Retrieve available properties for contacts
#'
#' @param apikey API key to work with Hubspot
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_contact_properties()
get_contact_properties <- function(apikey = "demo") {
  base_url <- "https://api.hubapi.com"
  properties_url <- httr::modify_url(base_url,
    path = "/properties/v1/contacts/properties"
  )
  res <- httr::GET(properties_url, query = list(hapikey = apikey))
  properties <- map_chr(httr::content(res), "name")

  return(properties)
}
