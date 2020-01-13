#' Get companies
#'
#' @description Soon to be deprecated! Use `hs_companies_raw()`.
#'
#' @template token_path
#' @template apikey
#' @param properties Character vector of properties to request
#' @param property_history Whether version history for properties should be
#' returned
#' @param max_iter The API is limited to 250 responses, use `max_iter` to
#' limit how many pages of data will get returned
#' @param max_properties Avoid URLs that are too long, limit the number of
#' properties returned, if required.
#'
#' @return List with company data
#' @export
#' @family getters
#' @examples
#' companies <- hs_companies_raw(
#'   property_history = "false", max_iter = 1,
#'   max_properties = 10
#' )
get_companies <- function(token_path = hubspot_token_get(),
                             apikey = hubspot_key_get(),
                             properties = get_company_properties(
                               token_path,
                               apikey
                             ),
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
#' @examples
#' companies <- company_properties()
company_properties <- function(companies = get_companies(max_iter = 1)) {

  .Deprecated("hs_companies_tidy")

  .company_properties(companies = companies)
}

