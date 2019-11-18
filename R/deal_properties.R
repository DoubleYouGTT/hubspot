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
    purrr::map("properties") %>%
    purrr::modify_depth(2, ~ .$value) %>%
    purrr::map_df(tibble::as_tibble, .id = "dealId") %>%
    numeric_converter() %>%
    epoch_converter()
}
