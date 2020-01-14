#' Owners endpoint (raw and tidy)
#'
#' @description Retrieve raw and tidy results from [the owners endpoint](https://developers.hubspot.com/docs/methods/owners/get_owners).
#'
#' @details Inactive owners are defined as owners without any active remotes.
#' @template token_path
#' @template apikey
#' @template include_inactive
#' @template email
#'
#' @return List of owners (`hs_owners_raw()`)
#' @rdname owners
#' @export
#' @examples
#' \dontrun{
#' owners <- hs_owners_raw()
#' active_owners <- hs_owners_raw(include_inactive = FALSE)
#' hs_owners_raw(email = "demo@hubspot.com")
#' }
hs_owners_raw <- function(token_path = hubspot_token_get(),
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


# tidiers ---------------------------------------------------------
#' @template owners
#' @template view
#' @details
#' Different `view` values and associated output.
#' * "owners": A tibble with owners and related information.
#'
#' @return A tibble of owners (`hs_owners_tidy()`)
#' @export
#'
#' @rdname owners
hs_owners_tidy <- function(owners = hs_owners_raw(),
                           view = c("owners")) {

  view <- match.arg(view, c("owners"))

  switch(view,
         "owners" = .owners(owners))

}

.owners <- function(owners = get_owners()) {
  owners %>%
    purrr::map(purrr::compact) %>%
    purrr::map_df(tibble::as_tibble) %>%
    dplyr::select(-dplyr::starts_with("remoteList")) %>%
    numeric_converter() %>%
    epoch_converter()
}
