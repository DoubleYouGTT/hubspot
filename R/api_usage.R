#' @importFrom rlang .data
#'
#' @title Check daily API usage
#'
# nolint start
#' @description Check daily API usage [via the dedicated API endpoint](https://developers.hubspot.com/docs/methods/check-daily-api-usage).
# nolint end
#'
#' @template apikey
#' @return A data.frame with API usage info
#' @export
#'
#' @examples
#' \dontrun{
#' hubspot_api_usage()
#' }
hubspot_api_usage <- function(apikey = hubspot_key_get()) {
  tz <- hubspot_tz(
    apikey = apikey,
    token_path = NULL
  )

  get_results("/integrations/v1/limit/daily",
    apikey = apikey,
    token_path = NULL
  ) %>%
    .[[1]] %>%
    tibble::as_tibble() %>%
    dplyr::select(-.data$name) %>%
    dplyr::mutate(
      collectedAt = anytime::anytime(.data$collectedAt / 1000,
        tz = tz
      ),
      resetsAt = anytime::anytime(.data$resetsAt / 1000,
        tz = tz
      )
    )
}
