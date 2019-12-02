#' Deals endpoint (raw and tidy)
#'
#' @inheritParams get_companies
#' @param associations Retrieve links to other entities
#'
#' @return List with deals data
#' @export
#' @rdname deals
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

# tidiers ---------------------------------------------------------
#' @param deals A list as returned by `hs_deals_raw()`
#' @param view A view
#' @details
#' * "associations": A tibble with associated entities
#' * "properties history": A tibble of all field changes over time
#' * "properties": A tibble containing all properties of deals
#' * "stages history": A tibble containing all stages a deal has gone through
#'
#' @return A tibble
#' @export
#'
#' @rdname deals
#' @examples \dontrun{
#' hs_deals_tidy(view = "properties")
#' }
hs_deals_tidy <- function(deals = hs_deals_raw(
  property_history = "true",
  associations = "false",
  max_iter = 1
), view = c("associations", "properties history",
            "properties", "stages history")) {

  view <- match.arg(view, c("associations", "properties history",
                            "properties", "stages history"))

  switch(view,
         "associations" = .deals_associations(deals),
         "properties history" = .deals_properties_history(deals),
         "properties" = .deals_properties(deals),
         "stages history" = .deals_stages_history(deals))

}


.deals_properties_history <- function(deals) {
  deals %>%
    purrr::map("properties") %>%
    purrr::map(purrr::flatten) %>%
    purrr::map("versions") %>%
    purrr::flatten() %>%
    purrr::modify_depth(2, ~ ifelse(length(.) == 0, NA_integer_, .)) %>%
    purrr::map_df(tibble::as_tibble, .id = "dealId") %>%
    epoch_converter()
}

.deals_properties <- function(deals) {
  deals %>%
    purrr::map("properties") %>%
    purrr::modify_depth(2, ~ .$value) %>%
    purrr::map_df(tibble::as_tibble, .id = "dealId") %>%
    numeric_converter() %>%
    epoch_converter()
}


.deals_stages_history <- function(deals) {
  deals %>%
    purrr::map(c("properties", "dealstage", "versions")) %>%
    purrr::flatten() %>%
    purrr::map(head, 4) %>%
    purrr::map_df(tibble::as_tibble, .id = "dealId") %>%
    epoch_converter()
}

.deals_associations <- function(deals) {
  deals %>%
    purrr::map("associations") %>%
    tibble::tibble(Ids = .) %>%
    dplyr::mutate(dealId = names(.data[["Ids"]])) %>%
    tidyr::unnest(cols = c(.data$Ids)) %>%
    dplyr::mutate(dealId = as.integer(.data$dealId)) %>%
    dplyr::mutate(type = rep(
      c("contacts", "companies", "deals", "tickets"), dplyr::n() / 4
    )) %>%
    tidyr::unnest(cols = c(.data$Ids)) %>%
    tidyr::unnest(cols = c(.data$Ids)) %>%
    epoch_converter()
}
