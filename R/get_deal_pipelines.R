#' Retrieve available pipelines for deals
#'
#' @template token_path
#' @template apikey
#' @template include_inactive
#'
#' @return  List with deal pipeline data
#' @details Inactive pipelines are defined as deleted pipelines.
#' @export
#' @family getters
#' @examples
#' pipelines <- get_deal_pipelines()
get_deal_pipelines <- function(token_path = hubspot_token_get(),
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
