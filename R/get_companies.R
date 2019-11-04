#' Get a list of all companies, including a set of properties
#'
#' @param apikey API key to work with Hubspot
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
#' companies <- get_companies(property_history = "false", max_iter = 1,
#'                            max_properties = 10)
get_companies <- function(apikey = "demo",
                          properties = get_company_properties(apikey),
                          property_history = "true",
                          max_iter = 10,
                          max_properties = 100) {

  properties <- head(properties, max_properties)

  query <- c(
    list(
      limit = 250,
      propertiesWithHistory = property_history
    ),
    set_names(
      lapply(properties, function(x) {
        x
      }),
      rep("properties", length(properties))
    )
  )

  companies <- get_results_paged(path = "/companies/v2/companies/paged",
                                 max_iter = max_iter, query = query,
                                 apikey = apikey, element = "companies",
                                 hasmore_name = "has-more")

  companies <- purrr::set_names(companies,
                                purrr::map_dbl(companies, "companyId"))

  return(companies)
}
