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

  .deal_properties_history(deals = deals)

}

#' Extract a table of deal IDs and simple property values
#'
#' Soon deprecated! Use `hs_deals_tidy(deals, view = "properties")`
#'
#' @inheritParams deal_associations
#'
#' @return A tibble with associated entities
#' @export
#'
#' @examples
#' deals <- deal_properties()
deal_properties <- function(deals = get_deals(max_iter = 1)) {

  .Deprecated("hs_deals_tidy")

  .deal_properties(deals)
}

#' Retrieve the version history of deal stages
#'
#' Soon deprecated! Use `hs_deals_tidy(deals, view = "properties")`
#'
#' @inheritParams deal_properties
#'
#' @return A tbl containing all stages a deal has gone through
#' @export
#'
#' @examples
#' hist <- deal_stages_history()
deal_stages_history <- function(deals = get_deals(
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
#' @param deals A deals list object, typically produced by running `hs_deals_raw`
#'
#' @return A tibble with associated entities
#' @export
#'
#' @examples
#' assoc <- deal_associations()
deal_associations <- function(deals = get_deals(
  max_iter = 10,
  max_properties = 1,
  associations = "true"
)) {

  .Deprecated("hs_deals_tidy")

  .deals_associations(deals)
}

