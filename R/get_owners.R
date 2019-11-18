#' Retrieve owners
#'
#' @inheritParams get_company_properties
#'
#' @return List of owners
#' @export
#' @family getters
#' @examples
#' owners <- get_owners()
get_owners <- function(apikey = hubspot_key_get()) {
  get_results(path = "/owners/v2/owners",
              apikey = apikey)
}
