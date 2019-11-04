#' Retrieve available properties for deals
#'
#' @param apikey API key
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_deal_properties()
get_deal_properties <- function(apikey = "demo") {
  res <- get_results(path = "/properties/v1/deals/properties/",
                     apikey = apikey)

  properties <- purrr::map_chr(httr::content(res), "name")

  return(properties)
}
