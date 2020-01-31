#' WIP - Get all engagements (raw and tidy)
#'
#' @description Get all of the engagements in a portal.  Returns a paginated set of engagements. from the [Get all engagements endpoint](https://developers.hubspot.com/docs/methods/engagements/get-all-engagements).
#' @details Required scope(s) for the OAuth token: contacts.
#'
#' @template token_path
#' @template apikey
#' @template max_iter
#'
#' @return A list (`hs_engagements_raw()`)
#' @rdname engagements
#' @aliases hs_engagements_raw
#' @export
#' @examples
#' \donttest{
#' engagements <- hs_engagements_raw()
#' hs_engagements_tidy(engagements)
#' }

hs_engagements_raw <- function(token_path = hubspot_token_get(),
                               apikey = hubspot_key_get(),
                               max_iter = 10) {
  path <- "/engagements/v1/engagements/paged"
  query <- list(
    count = 250
  )

  engagements <- get_results_paged(
    path = path,
    token_path = token_path,
    apikey = apikey,
    query = query,
    max_iter = max_iter,
    element = "results",
    hasmore_name = "hasMore",
    offset_name_in = "offset",
    offset_name_out = "offset"
  )

  purrr::set_names(
    engagements,
    purrr::map_dbl(engagements, c("engagement","id"))
  )

}

# tidiers -----------------------------------------------------------------

#' @rdname engagements
#' @aliases hs_engagements_tidy
#' @template engagements
#' @template view
#' @details view = "id" returns a list of all engagements, type, created and modified dates listed by ID.
#' @details view = "contacts" also returns associated contacts, one contact ID per row
#' @details view = "companies" also returns associated companies, one company ID per row
#' @details view = "deals" also returns associated deals, one deal ID per row
#' @return A tibble with associated entities (`hs_engagements_tidy()`)
#' @export

hs_engagements_tidy <- function(engagements = hs_engagements_raw(),
                                view = "id") {

  view <- match.arg(view, c("id","contacts","companies","deals"))
  switch(view,
         "id" = .engagement_ids(engagements),
         "contacts" = .engagement_contacts(engagements),
         "companies" = .engagement_companies(engagements),
         "deals" = .engagement_deals(engagements))
}

.engagement_ids <- function(engagements){

  tibble::tibble(
    id = names(engagements),
    type = purrr::map_chr(engagements, c("engagement","type")),
    createdAt = purrr::map_dbl(engagements, c("engagement","createdAt")),
    lastUpdated = purrr::map_dbl(engagements, c("engagement","lastUpdated"))
  ) %>% epoch_converter()
}

.engagement_contacts <- function(engagements){

  tibble::tibble(
    id = names(engagements),
    type = purrr::map_chr(engagements, c("engagement","type")),
    createdAt = purrr::map_dbl(engagements, c("engagement","createdAt")),
    lastUpdated = purrr::map_dbl(engagements, c("engagement","lastUpdated")),
    associatedContacts = purrr::map(engagements,c("associations","contactIds"))
  ) %>% epoch_converter() %>%
    tidyr::unnest(c("associatedContacts")) %>%
    dplyr::mutate(associatedContacts = purrr::map_int(engagements$associatedContacts,1))
}

.engagement_companies <- function(engagements){

  tibble::tibble(
    id = names(engagements),
    type = purrr::map_chr(engagements, c("engagement","type")),
    createdAt = purrr::map_dbl(engagements, c("engagement","createdAt")),
    lastUpdated = purrr::map_dbl(engagements, c("engagement","lastUpdated")),
    associatedCompanies = purrr::map(engagements,c("associations","companyIds"))
  ) %>% epoch_converter() %>%
    tidyr::unnest(c("associatedCompanies")) %>%
    dplyr::mutate(associatedCompanies = purrr::map_int(engagements$associatedCompanies,1))

}

.engagement_deals <- function(engagements){

  tibble::tibble(
    id = names(engagements),
    type = purrr::map_chr(engagements, c("engagement","type")),
    createdAt = purrr::map_dbl(engagements, c("engagement","createdAt")),
    lastUpdated = purrr::map_dbl(engagements, c("engagement","lastUpdated")),
    associatedDeals = purrr::map(engagements,c("associations","dealIds"))
  ) %>% epoch_converter() %>%
    tidyr::unnest(c("associatedDeals")) %>%
    dplyr::mutate(associatedDeals = purrr::map_int(engagements$associatedDeals,1))
}
