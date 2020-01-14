#' Retrieve available pipelines for deals
#'
#' @description Soon to be deprecated! Use `hs_deal_pipelines_raw()`.
#'
#' @template token_path
#' @template apikey
#' @template include_inactive
#'
#' @return  List with deal pipeline data
#' @details Inactive pipelines are defined as deleted pipelines.
#' @export
get_deal_pipelines <- function(token_path = hubspot_token_get(),
                               apikey = hubspot_key_get(),
                               include_inactive = "EXCLUDE_DELETED") {

  .Deprecated("hs_deal_pipelines_raw")

  hs_deal_pipelines_raw(token_path = token_path,
                        apikey = apikey,
                        include_inactive = include_inactive)
}

#' Extract a table of pipeline IDs and property values
#'
#' @description Soon to be deprecated! Use `hs_deal_pipelines_tidy(pipelines, view = "properties")`.
#'
#' @template deal_pipelines
#'
#' @return A tibble of deal pipelines
#' @export
#'
deal_pipelines <- function(deal_pipelines = hs_deal_pipelines_raw()) {

  .Deprecated("hs_deal_pipelines_tidy")

  .deal_pipelines(deal_pipelines = deal_pipelines)
}

#' Extract a table of pipeline IDs and stages
#'
#' @description Soon to be deprecated! Use `hs_deal_pipelines_tidy(pipelines, view = "stages")`.
#'
#' @template deal_pipelines
#'
#' @return A tibble of deal pipeline stages
#' @export
#'
deal_pipeline_stages <- function(deal_pipelines = hs_deal_pipelines_raw()) {


  .Deprecated("hs_deal_pipelines_tidy")

  .deal_pipeline_stages(deal_pipelines = deal_pipelines)

}


