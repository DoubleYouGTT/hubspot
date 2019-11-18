#' Check daily API usage
#'
#' @description Check daily API usage [via the dedicated API endpoint](https://developers.hubspot.com/docs/methods/check-daily-api-usage).
#'
#' @inheritParams get_company_properties
#' @return A data.frame with API usage info
#' @export
#'
#' @examples
#' \dontrun{
#' hubspot_api_usage()
#' }
hubspot_api_usage <- function(apikey = hubspot_key_get()) {

  tz <- hubspot_tz(apikey = apikey)

  get_results("/integrations/v1/limit/daily",
              apikey = apikey) %>%
    .[[1]] %>%
    tibble::as_tibble() %>%
    dplyr::select(-name) %>%
    dplyr::mutate(collectedAt = anytime::anytime(collectedAt / 1000,
                                                 tz = tz),
                  resetsAt = anytime::anytime(resetsAt / 1000,
                                              tz = tz))
}
