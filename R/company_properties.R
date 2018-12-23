#' Extract a table of company IDs and simple property values
#'
#' @param companies A companies return from `get_companies()`
#'
#' @return A tibble with associated entities
#' @export
#'
#' @examples
#' companies <- company_properties()
company_properties <- function(companies = get_companies(max_iter = 1)) {
  companies %>%
    map("properties") %>%
    modify_depth(2, ~ .$value) %>%
    map_df(as_data_frame, .id = "companyId") %>%
    mutate_if(~ sum(is.na(.)) == sum(is.na(as.numeric(.))), as.numeric) %>%
    epoch_converter() ->
  result

  return(result)
}
