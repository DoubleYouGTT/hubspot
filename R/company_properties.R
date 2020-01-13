#' Extract a table of company IDs and simple property values
#'
#' @template companies
#'
#' @return A tibble with associated entities
#' @export
#'
#' @examples
#' companies <- company_properties()
company_properties <- function(companies = get_companies(max_iter = 1)) {
  companies %>%
    purrr::map("properties") %>%
    purrr::modify_depth(2, ~ .$value) %>%
    purrr::map_df(tibble::as_tibble, .id = "companyId") %>%
    numeric_converter() %>%
    epoch_converter()
}
