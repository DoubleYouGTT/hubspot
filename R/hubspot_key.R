#' Get the Hubspot secret API key
#'
#' @return The key (a string)
#' @export
#'
#' @examples hubspot_key_get()
#' @details If no key was stored via [`hubspot_key_set()`] then "demo" is
#' returned, along with a message.
#' @family auth
hubspot_key_get <- function() {
  key <- try(keyring::key_get("hubspot"), silent = TRUE)

  if (methods::is(key, "try-error")) {
    message("Could not find Hubspot API key, will use the 'demo' key.
Please run hubspot_key_set() to set your API key.")
    key <- "demo"
  }

  return(key)
}




#' Set the Hubspot secret API key
#'
#' @param key API key. If not provided via this argument, the key will have
#'  to be provided interactively.
#'
#' @export
#'
#' @examples \dontrun{
#' hubspot_key_set("yourapikey")
#' }
#' @family auth
hubspot_key_set <- function(key = NULL) {

  if (is.null(key)) {
    keyring::key_set("hubspot")
  } else {
    keyring::key_set_with_value(password = key,
                                service = "hubspot")
  }

  message("Key saved for the service 'hubspot'")
}
