#' Get a list of all deals, including a set of properties
#'
#' @inheritParams get_companies
#' @param associations Retrieve links to other entities
#'
#' @return List with deals data
#' @export
#' @family getters
#' @examples \dontrun{
#' deals <- hs_deals_raw(
#'   property_history = "false", max_iter = 1,
#'   max_properties = 10
#' )
#' }
hs_deals_raw <- function(token_path = hubspot_token_get(),
                      apikey = hubspot_key_get(),
                      properties = get_deal_properties(
                        token_path,
                        apikey
                      ),
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

  deals <- get_results_paged(
    path = "/deals/v1/deal/paged",
    max_iter = max_iter, query = query,
    token_path = token_path,
    apikey = apikey, element = "deals",
    hasmore_name = "hasMore"
  )

  deals <- purrr::set_names(
    deals,
    purrr::map_dbl(deals, "dealId")
  )

  return(deals)
}

get_deals <- function(token_path = hubspot_token_get(),
                         apikey = hubspot_key_get(),
                         properties = get_deal_properties(
                           token_path,
                           apikey
                         ),
                         property_history = "true",
                         associations = "true",
                         max_iter = 10,
                         max_properties = 100) {

  .Deprecated("hs_deals_raw")

  hs_deals_raw(token_path = token_path,
   apikey = apikey,
   properties = properties,
   property_history = property_history,
   associations = associations,
   max_iter = max_iter,
   max_properties = max_properties)
}

