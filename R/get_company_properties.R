#' Retrieve available properties for companies
#'
#' @param token_path Path to OAuth 2.0 token
#' @param apikey API key to work with Hubspot (only used if `token_path`
#' is `NULL`)
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_company_properties()
get_company_properties <- function(token_path = hubspot_token_get(),
                                   apikey = hubspot_key_get()) {

  get_results(path = "/properties/v1/companies/properties/",
              apikey = apikey,
              token_path = token_path) %>%
    purrr::map_chr("name")
}
