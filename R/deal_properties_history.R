#' Retrieve the changes of all properties for a given set of deals
#'
#' @inheritParams deal_associations
#'
#' @return A tbl of all field changes over time
#' @export
#'
#' @examples
#' hist <- deal_properties_history()
deal_properties_history <- function(deals = get_deals(
                                      property_history = "true",
                                      associations = "false",
                                      max_iter = 1
                                    )) {
  deals %>%
    map("properties") %>%
    map(flatten) %>%
    map("versions") %>%
    flatten() %>%
    modify_depth(2, ~ ifelse(length(.) == 0, NA_integer_, .)) %>%
    map_df(as_tibble, .id = "dealId") %>%
    epoch_converter()
}
