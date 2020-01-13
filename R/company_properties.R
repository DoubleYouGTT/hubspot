#' Company properties endpoint
#'
#' Retrieve available properties for companies from [the company properties endpoint](https://developers.hubspot.com/docs/methods/companies/get_company_properties).
#'
#' @template token_path
#' @template apikey
#'
#' @return Character vector of properties
#' @export
#' @examples
#' properties <- hs_company_properties_raw()
hs_company_properties_raw <- function(token_path = hubspot_token_get(),
                                      apikey = hubspot_key_get()) {
  get_results(
    path = "/properties/v1/companies/properties/",
    apikey = apikey,
    token_path = token_path
  ) %>%
    purrr::map_chr("name")
}
