#' Retrieve the changes of all properties for a given set of deals
#'
#' Soon deprecated! Use `hs_deals_raw()`
#'
#' @template token_path
#' @template apikey
#' @template properties
#' @template property_history
#' @template associations
#' @template max_iter
#' @template max_properties
#'
#' @return List with deals data
#' @export
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

#' Retrieve the changes of all properties for a given set of deals
#'
#' Soon deprecated! Use `hs_deals_tidy(deals, view = "properties history")`
#'
#' @inheritParams deal_associations
#'
#' @return A tbl of all field changes over time
#' @export
#'
deal_properties_history <- function(deals = hs_deals_raw(
  property_history = "true",
  associations = "false",
  max_iter = 1
)) {


  .Deprecated("hs_deals_tidy")

  .deals_properties_history(deals = deals)

}

#' Extract a table of deal IDs and simple property values
#'
#' Soon deprecated! Use `hs_deals_tidy(deals, view = "properties")`
#'
#' @inheritParams deal_associations
#'
#' @return A tibble with associated entities
#' @export
deal_properties <- function(deals = hs_deals_raw(max_iter = 1)) {

  .Deprecated("hs_deals_tidy")

  .deals_properties(deals)
}

#' Retrieve the version history of deal stages
#'
#' Soon deprecated! Use `hs_deals_tidy(deals, view = "properties")`
#'
#' @inheritParams deal_properties
#'
#' @return A tbl containing all stages a deal has gone through
#' @export
deal_stages_history <- function(deals = hs_deals_raw(
  properties = "dealstage",
  property_history = "true",
  associations = "false"
)) {

  .Deprecated("hs_deals_tidy")

  .deals_stages_history(deals)
}

#' Extract a table of associations from a deals list
#'
#' Soon deprecated! Use `hs_deals_tidy(deals, view = "associations")`
#'
#' @template deals
#'
#' @return A tibble with associated entities
#' @export
deal_associations <- function(deals = hs_deals_raw(
  max_iter = 10,
  max_properties = 1,
  associations = "true"
)) {

  .Deprecated("hs_deals_tidy")

  .deals_associations(deals)
}

