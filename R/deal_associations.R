#' Extract a table of associations from a deals list
#'
#' @param deals A deals list object, typically produced by running `get_deals`
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
