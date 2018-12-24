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
get_deal_pipelines <- function(apikey = "demo",
                               include_inactive = "EXCLUDE_DELETED") {
  include_inactive <- match.arg(
    include_inactive,
    c("EXCLUDE_DELETED", "INCLUDE_DELETED")
  )
  base_url <- "https://api.hubapi.com"
  properties_url <- httr::modify_url(base_url,
    path = "/crm-pipelines/v1/pipelines/deals/"
  )
  res <- httr::GET(properties_url,
    query = list(
      hapikey = apikey,
      includeInactive = include_inactive
    )
  )
  pipelines <- httr::content(res)

  return(pipelines)
}
