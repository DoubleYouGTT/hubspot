#' LD Hubspot App info
#' @return Named list
#' @noRd
ld_hubspot_app <- function() {
  list(client_secret = "2c0b347e-1e2a-4db7-a31a-aaa0b2fcad13",
       client_id = "5975ba5c-900c-4fd7-94dd-04df023e4263",
       app_id = "205749")
}

#' Authorize URL for OAuth
#' @return Authorize URL (character)
#' @noRd
authorize_url <- function() {
  paste0("https://app.hubspot.com/oauth/authorize?client_id=",
         ld_hubspot_app()$client_id,
         "&scope=contacts%20content%20forms%20tickets%20e-commerce")
}

#' Access URL for OAuth
#' @return Access URL (character)
#' @noRd
access_url <- function() {
  "https://api.hubapi.com/oauth/v1/token"
}

#' Endpoint for OAuth
#' @return OAuth endpoint (httr special class)
#' @noRd
hubspot_oauth_endpoint <- function(){
  endpoint <- httr::oauth_endpoint(authorize = authorize_url(),
                                   access = access_url())

}

#' Auth info from parameters provided
#' @return Named list
#' @noRd
hubspot_auth <- function(token_path, apikey) {
  if (is.null(token_path)) {

    if (is.null(apikey)) {

    list(auth = "key",
         value = hubspot_key_get())
    } else {
      list(auth = "key",
           value = apikey)
    }
  } else {
    list(auth = "token",
         value = token_path)
  }
}

hubspot_oauth_app <- function() {

  oauth_app <- httr::oauth_app(appname = "MyHubSpotApp",
                               key = ld_hubspot_app()$client_id,
                               secret = ld_hubspot_app()$client_secret)
}


#' Create Hubspot authorization token.
#'
#' @includeRmd vignettes/rmdhunks/auth.Rmd
#'
#' @return
#' @family auth
#' @export
#'
#' @examples
hubspot_token_get <- function() {

  token <- httr::oauth2.0_token(endpoint = hubspot_oauth_endpoint(),
                                oauth_app = hubspot_oauth_app())

}
