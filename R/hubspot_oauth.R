#' LD Hubspot App info
#' @return Named list
#' @keywords internal
#' @export
ld_hubspot_app <- function() {
  list(client_secret = "2c0b347e-1e2a-4db7-a31a-aaa0b2fcad13",
       client_id = "5975ba5c-900c-4fd7-94dd-04df023e4263",
       app_id = "205749",
       scope = c("contacts", "content", "forms", "tickets",
                  "e-commerce"))
}


#' Make a string about scope for the authorize URL
#' @noRd
make_scopes_string <- function(scope){
  scope_part <- glue::glue_collapse(scope, sep = "%20")
  glue::glue("&scope={scope_part}")
  "&scope=contacts%20content%20forms%20tickets%20e-commerce"
}

#' Authorize URL for OAuth
#' @return Authorize URL (character)
#' @noRd
authorize_url <- function(app_info) {
  paste0("https://app.hubspot.com/oauth/authorize?client_id=",
         app_info$client_id,
         make_scopes_string(app_info$scope)
         )
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
hubspot_oauth_endpoint <- function(app_info){
  endpoint <- httr::oauth_endpoint(authorize = authorize_url(app_info),
                                   access = access_url())

}

hubspot_oauth_app <- function(app_info) {

  oauth_app <- httr::oauth_app(appname = "MyHubSpotApp",
                               key = app_info$client_id,
                               secret = app_info$client_secret)
}


#' Create Hubspot authorization token.
#'
#' @includeRmd vignettes/rmdhunks/oauth.Rmd
#' @includeRmd vignettes/rmdhunks/auth.Rmd
#'
#' @param app_info A named list with client_secret, client_id, app_id and
#' scopes.
#' @param set_renv Logical indicating whether to save the created token
#'   as the default environment hubspot token variable. Defaults to TRUE,
#'   meaning the token is saved to user's home directory as either the user
#'   provided path, or
#'   ".hubspot_token.rds" (or, if that already exists, then
#'   .hubspot_token1.rds or .hubspot_token2.rds, etc.) and the path to the
#'   token to said token is then set in the user's .Renviron file and re-
#'   read to start being used in current active session.
#' @param token_path Path where to save the token. If `set_renv` is `FALSE`,
#'  this is ignored.
#
#' @return
#' @family auth
#' @export
#'
#' @examples
hubspot_token_get <- function(app_info = ld_hubspot_app(),
                              set_renv = TRUE,
                              token_path = NULL) {

  token <- httr::oauth2.0_token(endpoint =
                                  hubspot_oauth_endpoint(app_info),
                                app =
                                  hubspot_oauth_app(app_info),
                                cache = FALSE)

  # from https://github.com/ropensci/rtweet/blob/1bd1e16d14df8b31a13a8c2f0e0ff0e87ea066d1/R/tokens.R#L219
  if (set_renv) {
    if(is.null(token_path)) {
      token_path <- uq_filename(file.path(home(), ".hubspot_token.rds"))
    }

    saveRDS(token, file = token_path, compress = FALSE)
    set_renv("HUBSPOT_PAT" = token_path)
  }

  return(token)

}
