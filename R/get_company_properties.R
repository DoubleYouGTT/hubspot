#' Retrieve available properties for companies
#'
#' @template token_path
#' @template apikey
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_company_properties()
get_company_properties <- function(token_path = hubspot_token_get(),
                                   apikey = hubspot_key_get()) {
  get_results(
    path = "/properties/v1/companies/properties/",
    apikey = apikey,
    token_path = token_path
  ) %>%
    purrr::map_chr("name")
}
