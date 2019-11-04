#' Retrieve available properties for companies
#'
#' @param apikey API key to work with Hubspot
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_company_properties()
get_company_properties <- function(apikey = "demo") {
  res <- get_results(path = "/properties/v1/companies/properties/",
                     apikey = apikey)

  properties <- purrr::map_chr(httr::content(res), "name")

  return(properties)
}
