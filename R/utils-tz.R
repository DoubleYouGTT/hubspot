#' Account timezone
#' @return Timezone (character)
#' @noRd
hubspot_tz <- function(apikey = hubspot_key_get()){
  get_results("/integrations/v1/me",
              apikey = apikey)[["timeZone"]]
}
