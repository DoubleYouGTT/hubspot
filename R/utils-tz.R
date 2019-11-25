#' Account timezone
#' @return Timezone (character)
#' @noRd
.hubspot_tz <- function(token_path = hubspot_token_get(),
                        apikey = hubspot_key_get()) {

  get_results("/integrations/v1/me",
              token_path = token_path,
              apikey = apikey)[["timeZone"]]
}

hubspot_tz <- memoise::memoise(.hubspot_tz)
