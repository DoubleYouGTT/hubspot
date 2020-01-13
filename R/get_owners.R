#' Retrieve owners
#'
# nolint start
#' @description Retrieve owners [from the owners API endpoint](https://developers.hubspot.com/docs/methods/owners/get_owners).
# nolint end
#'
#' @details Inactive owners are defined as owners without any active remotes.
#' @template token_path
#' @template apikey
#' @template include_inactive
#' @template email
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
get_owners <- function(token_path = hubspot_token_get(),
                       apikey = hubspot_key_get(),
                       include_inactive = TRUE,
                       email = NULL) {
  query <- list(
    includeInactive = include_inactive,
    email = email
  )

  get_results(
    path = "/owners/v2/owners",
    token_path = token_path,
    apikey = apikey,
    query = query
  )
}
