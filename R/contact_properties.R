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
    map("properties") %>%
    modify_depth(2, ~ .$value) %>%
    map_df(as_tibble, .id = "vid") %>%
    mutate_if(~ sum(is.na(.)) == suppressWarnings(sum(is.na(as.numeric(.)))), as.numeric) %>%
    epoch_converter() ->
  result

  return(result)
}
