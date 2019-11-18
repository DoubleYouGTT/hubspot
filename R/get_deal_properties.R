#' Retrieve available properties for deals
#'
#' @param apikey API key
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_deal_properties()
get_deal_properties <- function(apikey = hubspot_key_get()) {
  get_results(path = "/properties/v1/deals/properties/",
              apikey = apikey) %>%
    purrr::map_chr("name")
}
