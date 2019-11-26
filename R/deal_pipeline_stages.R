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
    purrr::flatten() %>%
    purrr::map(purrr::compact) %>%
    purrr::map_df(tibble::as_tibble) %>%
    dplyr::select(.data$pipelineId, .data$stages) %>%
    dplyr::mutate(stages = purrr::map(.data$stages, purrr::compact)) %>%
    dplyr::mutate(stages = purrr::map(
      .data$stages,
      tibble::as_tibble
    )) %>%
    tidyr::unnest(cols = c(.data$stages)) %>%
    dplyr::filter(dplyr::row_number() %% 2 == 0) %>%
    dplyr::mutate(probability = ifelse(is.na(as.numeric(.data$metadata)),
      as.logical(.data$metadata),
      as.numeric(.data$metadata)
    )) %>%
    dplyr::select(-.data$metadata) %>%
    epoch_converter() ->
  pipeline_stages

  pipelines %>%
    purrr::flatten() %>%
    purrr::map("stages") %>%
    purrr::flatten() %>%
    purrr::map_chr(c("metadata", "isClosed")) %>%
    as.logical() ->
  pipeline_stages$isClosed # nolint

  return(pipeline_stages)
}
