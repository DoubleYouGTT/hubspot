#' Extract a table of CRM owners
#'
#' @template owners
#'
#' @return data.frame of owners
#' @export
#'
#' @examples
#' crm_owners <- owners()
owners <- function(owners = get_owners()) {
  owners %>%
    purrr::map(purrr::compact) %>%
    purrr::map_df(tibble::as_tibble) %>%
    dplyr::select(-dplyr::starts_with("remoteList")) %>%
    numeric_converter() %>%
    epoch_converter()
}
