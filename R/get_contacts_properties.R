#' Retrieve available properties for contacts
#'
#' @param apikey API key to work with Hubspot
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_contact_properties()
get_contact_properties <- function(apikey = hubspot_key_get()) {
  get_results(path = "/properties/v1/contacts/properties",
              apikey = apikey) %>%
    purrr::map_chr("name")
}
