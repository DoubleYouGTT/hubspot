#' Deal properties endpoint (raw and tidy)
#'
#' Retrieve raw and tidy results from [the deal properties endpoint](https://developers.hubspot.com/docs/methods/deals/v2/get_deals_properties).
#'
#' @template token_path
#' @template apikey
#' @rdname deal-properties
#' @return List of deal properties (`hs_deal_properties_raw()`)
#' @export
#' @examples
#' properties <- hs_deal_properties_raw()
#' property_names <- hs_deal_properties_tidy(properties, view = "names")
hs_deal_properties_raw <- function(token_path = hubspot_token_get(),
                                      apikey = hubspot_key_get()) {

  get_results(
    path = "/properties/v1/deals/properties/",
    token_path = token_path,
    apikey = apikey
  )
}

# tidiers ---------------------------------------------------------
#' @template deal_properties
#' @template view
#' @details
#' Different `view` values and associated output.
#' * "names": A character vector of the names of available deal properties.
#'
#' @return Something tidy (`hs_deal_properties_tidy()`)
#' @export
#'
#' @rdname deal-properties
hs_deal_properties_tidy <- function(deal_properties = hs_deal_properties_raw(),
                                       view = "names") {

  view <- match.arg(view, c("names"))

  switch(view,
         "names" = .deal_properties_names(deal_properties))

}

.deal_properties_names <- function(deal_properties) {
  deal_properties %>%
    purrr::map_chr("name")
}

