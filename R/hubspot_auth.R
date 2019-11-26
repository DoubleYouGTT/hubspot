#' Auth info from parameters provided
#' @return Named list
#' @noRd
hubspot_auth <- function(token_path, apikey) {
  if (is.null(token_path)) {
    if (is.null(apikey)) {
      list(
        auth = "key",
        value = hubspot_key_get()
      )
    } else {
      list(
        auth = "key",
        value = apikey
      )
    }
  } else {
    list(
      auth = "token",
      value = token_path
    )
  }
}
