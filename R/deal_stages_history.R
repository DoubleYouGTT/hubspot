#' Retrieve the version history of deal stages
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
  deals %>%
    purrr::map(c("properties", "dealstage", "versions")) %>%
    purrr::flatten() %>%
    purrr::map(head, 4) %>%
    purrr::map_df(as_tibble, .id = "dealId") %>%
    epoch_converter()
}
