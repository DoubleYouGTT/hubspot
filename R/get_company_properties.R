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

  get_results(path = "/properties/v1/companies/properties/",
              apikey = apikey,
              token_path = token_path) %>%
    purrr::map_chr("name")
}
