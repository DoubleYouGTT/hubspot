#' Authorize URL for OAuth
#' @return Authorize URL (character)
#' @noRd
authorize_url <- function() {
  "https://app.hubspot.com/oauth/authorize?client_id=5975ba5c-900c-4fd7-94dd-04df023e4263&scope=contacts%20content%20forms%20tickets%20e-commerce"
}

#' Acess URL for OAuth
#' @return Access URL (character)
#' @noRd
access_url <- function() {
  "https://api.hubapi.com/oauth/v1/token"
}

#' Endpoint for OAuth
#' @return OAuth endpoint (httr special class)
#' @noRd
oauth_endpoint <- function(){
  endpoint <- httr::oauth_endpoint(authorize = authorize_url(),
                                   access = access_url())

}


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

oauth_app <- function() {
  client_secret <- "2c0b347e-1e2a-4db7-a31a-aaa0b2fcad13"
  client_id <- "5975ba5c-900c-4fd7-94dd-04df023e4263"
  app_id <- "205749"
  oauth_app <- httr::oauth_app(appname = "MyHubSpotApp",
                               key = client_id,
                               secret = client_secret)
}


get_token <- function() {


  token <- httr::oauth2.0_token(endpoint, oauth_app)

}
