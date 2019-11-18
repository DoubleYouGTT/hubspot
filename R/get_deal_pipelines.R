#' Retrieve available pipelines for deals
#'
#' @inheritParams get_company_properties
#' @param include_inactive Should deleted pipelines be returned
#'
#' @return  List with deal pipeline data
#' @export
#' @family getters
#' @examples
#' pipelines <- get_deal_pipelines()
get_deal_pipelines <- function(apikey = hubspot_key_get(),
                               include_inactive = "EXCLUDE_DELETED") {
  include_inactive <- match.arg(
    include_inactive,
    c("EXCLUDE_DELETED", "INCLUDE_DELETED")
  )

  get_results(path = "/crm-pipelines/v1/pipelines/deals/",
              apikey = apikey,
              query = list(includeInactive = include_inactive))

}
