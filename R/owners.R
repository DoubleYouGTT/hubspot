#' Extract a table of CRM owners
#'
#' @param owners Raw data from `get_owners()`
#'
#' @return data.frame of owners
#' @export
#'
#' @examples
#' crm_owners <- owners()
owners <- function(owners = get_owners()) {
  owners %>%
    map(compact) %>%
    map_df(as_tibble) %>%
    select(-starts_with("remoteList")) %>%
    mutate_if(~ sum(is.na(.)) == suppressWarnings(sum(is.na(as.numeric(.)))), as.numeric) %>%
    epoch_converter()
}
