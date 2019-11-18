#' Retrieve owners
#'
#' @description Retrieve owners [from the owners API endpoint](https://developers.hubspot.com/docs/methods/owners/get_owners).
#'
#' @inheritParams get_company_properties
#' @param include_inactive Boolean indicating whether to include inactive
#'  owners (defined as owners without any active remotes.)
#' @param email Search for owners matching the specified email address
#'  (exact match).
#'
#' @return List of owners
#' @export
#' @family getters
#' @examples
#' \dontrun{
#' owners <- get_owners()
#' active_owners <- get_owners(include_inactive = FALSE)
#' get_owners(email = "demo@hubspot.com")
#' }
get_owners <- function(apikey = hubspot_key_get(),
                       include_inactive = TRUE,
                       email = NULL) {

  query <- list(includeInactive = include_inactive,
                email = email)

  get_results(path = "/owners/v2/owners",
              apikey = apikey,
              query = query)
}
