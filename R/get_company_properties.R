#' Retrieve available properties for companies
#'
#' @param apikey API key to work with Hubspot
#' @param token_path Path to token
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_company_properties()
get_company_properties <- function(token_path = NULL,
                                   apikey = NULL) {

  auth <- hubspot_auth(token_path, apikey)

  get_results(path = "/properties/v1/companies/properties/",
              auth = auth) %>%
    purrr::map_chr("name")
}
