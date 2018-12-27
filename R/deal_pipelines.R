#' Extract a table of pipeline IDs and property values
#'
#' @param pipelines A list of pipelines from `get_deal_pipelines`
#'
#' @return A tibble of deal pipelines
#' @export
#'
#' @examples
#' deal_pipes <- deal_pipelines()
deal_pipelines <- function(pipelines = get_deal_pipelines()) {
  stages <- NULL
  pipelines %>%
    flatten() %>%
    map(compact) %>%
    map_df(as_data_frame) %>%
    select(-stages) %>%
    distinct()
}
