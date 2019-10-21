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
  # Variable fudge for check()
  dealId <- Ids <- `.` <- NULL

  deals %>%
    map("associations") %>%
    tibble(Ids = .) %>%
    mutate(dealId = names(.[["Ids"]])) %>%
    unnest(cols = c(Ids)) %>%
    mutate(dealId = as.integer(dealId)) %>%
    mutate(type = rep(
      c("contacts", "companies", "deals", "tickets"), n() / 4
    )) %>%
    unnest(cols = c(Ids)) %>%
    unnest(cols = c(Ids)) %>%
    epoch_converter()
}
