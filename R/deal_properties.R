#' Extract a table of deal IDs and simple property values
#'
#' @inheritParams deal_associations
#'
#' @return A tibble with associated entities
#' @export
#'
#' @examples
#' deals <- deal_properties()
deal_properties <- function(deals = get_deals(max_iter = 1)) {
  deals %>%
    map("properties") %>%
    modify_depth(2, ~ .$value) %>%
    map_df(as_data_frame, .id = "dealId") %>%
    mutate_if(~ sum(is.na(.)) == sum(is.na(as.numeric(.))), as.numeric)  %>%
    epoch_converter() ->
  result

  return(result)
}
