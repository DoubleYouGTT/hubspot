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
  pipelineId <- stages <- metadata <- NULL
  pipelines %>%
    flatten() %>%
    map(compact) %>%
    map_df(as_tibble) %>%
    select(pipelineId, stages) %>%
    mutate(stages = map(stages, compact)) %>%
    mutate(stages = map(stages, as_tibble)) %>%
    tidyr::unnest(cols = c(stages)) %>%
    filter(row_number() %% 2 == 0) %>%
    mutate(probability = ifelse(is.na(as.numeric(metadata)),
      as.logical(metadata),
      as.numeric(metadata)
    )) %>%
    select(-metadata) %>%
    epoch_converter() ->
  pipeline_stages

  pipelines %>%
    flatten() %>%
    map("stages") %>%
    flatten() %>%
    map_chr(c("metadata", "isClosed")) %>%
    as.logical() ->
  pipeline_stages$isClosed

  return(pipeline_stages)
}
