#' Extract a table of pipeline IDs and stages
#'
#' @param pipelines A list of pipelines from `get_deal_pipelines`
#'
#' @return A tibble of deal pipeline stages
#' @export
#'
#' @examples
#' deal_pipe_stages <- deal_pipeline_stages()
deal_pipeline_stages <- function(pipelines = get_deal_pipelines()) {

  pipelines %>%
    flatten() %>%
    map(compact) %>%
    map_df(as_tibble) %>%
    select(.data$pipelineId, .data$stages) %>%
    mutate(stages = map(.data$stages, compact)) %>%
    mutate(stages = map(.data$stages, as_tibble)) %>%
    tidyr::unnest(cols = c(.data$stages)) %>%
    filter(row_number() %% 2 == 0) %>%
    mutate(probability = ifelse(is.na(as.numeric(.data$metadata)),
      as.logical(.data$metadata),
      as.numeric(.data$metadata)
    )) %>%
    select(-.data$metadata) %>%
    epoch_converter() ->
  pipeline_stages

  pipelines %>%
    flatten() %>%
    map("stages") %>%
    flatten() %>%
    map_chr(c("metadata", "isClosed")) %>%
    as.logical() ->
  pipeline_stages$isClosed # nolint

  return(pipeline_stages)
}
