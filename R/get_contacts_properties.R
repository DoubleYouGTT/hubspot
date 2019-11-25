#' Retrieve available properties for contacts
#'
#' @param apikey API key to work with Hubspot
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_contact_properties()
get_contact_properties <- function(token_path = hubspot_token_get(),
                                   apikey = hubspot_key_get()) {
  get_results(path = "/properties/v1/contacts/properties",
              token_path = token_path,
              apikey = apikey) %>%
    purrr::map_chr("name")
}
