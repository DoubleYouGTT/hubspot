#' Extract a table of associations from a deals list
#'
#' @inheritParams get_deal_properties
#' @param deals A deals list object, typically produced by running `get_deals`
#'
#' @return A tibble with associated entities
#' @export
#'
#' @examples
#' assoc = deal_associations()
deal_associations <- function(apikey = "demo",
                              deals = get_deals(apikey,
                                max_iter = 10,
                                max_properties = 1,
                                associations = "true"
                              )) {
  # Variable fudge for check()
  dealId <- Ids <- `.` <- NULL

  deals %>%
    map("associations") %>%
    data_frame(Ids = .) %>%
    unnest(.id = "dealId") %>%
    mutate(dealId = as.integer(dealId)) %>%
    mutate(type = rep(
      c("contacts", "companies", "deals"),
      n() / 3
    )) %>%
    unnest(Ids) %>%
    unnest(Ids)
}
