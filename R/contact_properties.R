#' Extract a table of contact IDs and simple property values
#'
#' @param contacts A contacts return from `get_contacts()`
#'
#' @return A tibble with associated entities
#' @export
#'
#' @examples
#' contacts <- contact_properties()
contact_properties <- function(contacts = get_contacts(max_iter = 1)) {
  contacts %>%
    purrr::map("properties") %>%
    purrr::modify_depth(2, ~ .$value) %>%
    purrr::map_df(tibble::as_tibble, .id = "vid") %>%
    numeric_converter() %>%
    epoch_converter()
}
