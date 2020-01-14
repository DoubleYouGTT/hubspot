#' Get companies
#'
#' @description Soon to be deprecated! Use `hs_companies_raw()`.
#'
#' @template token_path
#' @template apikey
#' @template properties
#' @template property_history
#' @template max_iter
#' @template max_properties
#'
#' @return List with company data
#' @export
get_companies <- function(token_path = hubspot_token_get(),
                             apikey = hubspot_key_get(),
                          properties = hs_company_properties_tidy(
                            hs_company_properties_raw(
                              token_path,
                              apikey
                            )),
                             property_history = "true",
                             max_iter = 10,
                             max_properties = 100) {

  .Deprecated("hs_companies_raw")

  hs_companies_raw(
    token_path = token_path,
    apikey = apikey,
    properties = properties,
    property_history = property_history,
    max_iter = property_history,
    max_properties = property_history)
}

#' Extract a table of company IDs and simple property values
#'
#' @description Soon to be deprecated, use `hs_companies_tidy(companies, view = "properties")`.
#'
#' @template companies
#'
#' @return A tibble with associated entities
#' @export
#'
company_properties <- function(companies = get_companies(max_iter = 1)) {

  .Deprecated("hs_companies_tidy")

  .company_properties(companies = companies)
}

