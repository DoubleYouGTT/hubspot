#' Get a list of all companies, including a set of properties
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
#' companies <- get_companies(
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
  properties <- head(properties, max_properties)

  query <- c(
    list(
      limit = 250
    ),
    purrr::set_names(
      lapply(properties, function(x) {
        x
      }),
      if (property_history == "true") {
        rep("propertiesWithHistory", length(properties))
      } else {
        rep("properties", length(properties))
      }
    )
  )

  companies <- get_results_paged(
    path = "/companies/v2/companies/paged",
    max_iter = max_iter, query = query,
    token_path = token_path,
    apikey = apikey, element = "companies",
    hasmore_name = "has-more"
  )

  companies <- purrr::set_names(
    companies,
    purrr::map_dbl(companies, "companyId")
  )

  return(companies)
}
