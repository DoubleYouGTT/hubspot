#' Deal pipelines endpoint (raw and tidy)
#'
#' Get raw and tidy results from the [deal pipelines endpoint](https://developers.hubspot.com/docs/methods/deal-pipelines/get-all-deal-pipelines).
#'
#' @template token_path
#' @template apikey
#' @template include_inactive
#'
#' @return  List with deal pipeline data (`hs_deal_pipelines_raw()`)
#' @details Inactive pipelines are defined as deleted pipelines.
#' @export
#' @rdname deal-pipelines
#' @examples
#' deal_pipelines <- hs_deal_pipelines_raw()
#' properties <- hs_deal_pipelines_tidy(
#'   deal_pipelines,
#'   view = "properties"
#' )
#' stages <- hs_deal_pipelines_tidy(
#'   deal_pipelines,
#'   view = "stages"
#' )
hs_deal_pipelines_raw <- function(token_path = hubspot_token_get(),
                               apikey = hubspot_key_get(),
                               include_inactive = "EXCLUDE_DELETED") {
  include_inactive <- match.arg(
    include_inactive,
    c("EXCLUDE_DELETED", "INCLUDE_DELETED")
  )

  get_results(
    path = "/crm-pipelines/v1/pipelines/deals/",
    apikey = apikey,
    token_path = token_path,
    query = list(includeInactive = include_inactive)
  )
}

# tidiers -----------------------------------------------------------------

#' @template deal_pipelines
#' @template view
#' @details
#' Different `view` values and associated output.
#' * "properties": tibble of pipeline IDs and property values
#' * "stages": tibble of pipeline IDs and stages
#'
#' @export
#'
#' @rdname deal-pipelines
#'
#' @return A tibble with associated entities (`hs_deal_pipelines_tidy()`)
#' @export
#'

hs_deal_pipelines_tidy <- function(deal_pipelines = hs_deal_pipelines_raw(),
                             view = c("properties", "stages")) {

  view <- match.arg(view, c("properties", "stages"))

  switch(view,
         "properties" = .deal_pipelines(deal_pipelines),
         "stages" = .deal_pipeline_stages(deal_pipelines))

}

.deal_pipelines <- function(deal_pipelines) {
  stages <- NULL
  deal_pipelines %>%
    purrr::flatten() %>%
    purrr::map(purrr::compact) %>%
    purrr::map_df(tibble::as_tibble) %>%
    dplyr::select(-stages) %>%
    dplyr::distinct() %>%
    epoch_converter()
}

.deal_pipeline_stages <- function(deal_pipelines) {
  deal_pipelines %>%
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

  deal_pipelines %>%
    purrr::flatten() %>%
    purrr::map("stages") %>%
    purrr::flatten() %>%
    purrr::map_chr(c("metadata", "isClosed")) %>%
    as.logical() ->
    pipeline_stages$isClosed # nolint

  return(pipeline_stages)
}
