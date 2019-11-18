#' Get a list of all deals, including a set of properties
#'
#' @inheritParams get_companies
#' @param associations Retrieve links to other entities
#'
#' @return List with deals data
#' @export
#' @family getters
#' @examples
#' deals <- get_deals(property_history = "false", max_iter = 1,
#'                    max_properties = 10)
get_deals <- function(apikey = hubspot_key_get(),
                      properties = get_deal_properties(apikey),
                      property_history = "true",
                      associations = "true",
                      max_iter = 10,
                      max_properties = 100) {

  query <- c(
        list(
          limit = 250,
          includeAssociations = associations,
          propertiesWithHistory = property_history
        ),
        purrr::set_names(
          lapply(properties, function(x) {
            x
          }),
          rep("properties", length(properties))
        )
      )

  deals <- get_results_paged(path = "/deals/v1/deal/paged",
                             max_iter = max_iter, query = query,
                              apikey = apikey, element = "deals",
                             hasmore_name = "hasMore")

  deals <- purrr::set_names(deals,
                            purrr::map_dbl(deals, "dealId"))
}
