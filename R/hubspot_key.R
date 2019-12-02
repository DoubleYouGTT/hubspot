#' Get/set the Hubspot secret API key
#'
#' @description Get/set the Hubspot secret API key using the `keyring` package.
#' For a more secure authorization method, without a daily limit on calls,
#'  see [`hubspot_token_create()`]
#'
#' @return The key (a string)
#' @export
#'
#' @examples
#' hubspot_key_get()
#' @includeRmd man/rmdhunks/apikey.Rmd
#' @includeRmd man/rmdhunks/auth.Rmd
#' @rdname hubspot-key
hubspot_key_get <- function() {
  key <- try(keyring::key_get("hubspot"), silent = TRUE)

  if (methods::is(key, "try-error")) {
    message("Could not find Hubspot API key, will use the 'demo' key.
Please run hubspot_key_set() to set your API key.")
    key <- "demo"
  }

  return(key)
}




#' @param key API key. If not provided via this argument, the key will have
#'  to be provided interactively.
#'
#' @export
#' @rdname hubspot-key
#'
#' @examples
#' \dontrun{
#' hubspot_key_set("yourapikey")
#' }
#' @family auth
hubspot_key_set <- function(key = NULL) {
  if (is.null(key)) {
    keyring::key_set("hubspot")
  } else {
    keyring::key_set_with_value(
      password = key,
      service = "hubspot"
    )
  }

  message("Key saved for the service 'hubspot'")
}
