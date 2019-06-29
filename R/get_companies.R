#' Get a list of all companies, including a set of properties
#'
#' @param apikey API key to work with Hubspot
#' @param properties Character vector of properties to request
#' @param property_history Whether version history for properties should be returned
#' @param max_iter The API is limited to 250 responses, use `max_iter` to limit how many pages of data will get returned
#' @param max_properties Avoid URLs that are too long, limit the number of properties returned, if required.
#'
#' @return List with company data
#' @export
#' @family getters
#' @examples
#' companies <- get_companies(property_history = "false", max_iter = 1, max_properties = 10)
get_companies <- function(apikey = "demo",
                          properties = get_company_properties(apikey),
                          property_history = "true",
                          max_iter = 10,
                          max_properties = 100) {
  base_url <- "https://api.hubapi.com"
  properties_url <- httr::modify_url(base_url, path = "/companies/v2/companies/paged")
  properties <- head(properties, max_properties)
  companies <- list()
  n <- 0
  do <- TRUE
  offset <- 0

  while (do & n < max_iter) {
    res <- httr::GET(properties_url,
      query = c(
        list(
          offset = offset,
          hapikey = apikey,
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
    )
    n <- n + 1
    res_content <- httr::content(res)
    companies[n] <- list(res_content$companies)
    do <- res_content$`has-more`
    offset <- res_content$offset
  }

  companies <- flatten(companies)
  companies <- set_names(companies, map_dbl(companies, "companyId"))
}
