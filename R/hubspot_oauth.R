#' @return Named list
#' @keywords internal
#' @rdname hubspot-oauth
#' @export
default_ld_hubspot_app <- function() {
  list(
    client_secret = "2c0b347e-1e2a-4db7-a31a-aaa0b2fcad13",
    client_id = "5975ba5c-900c-4fd7-94dd-04df023e4263",
    app_id = "205749",
    scope = c(
      "contacts", "content", "forms", "tickets",
      "e-commerce"
    )
  )
}


#' Make a string about scope for the authorize URL
#' @noRd
make_scopes_string <- function(scope) {
  scope_part <- glue::glue_collapse(scope, sep = "%20")
  glue::glue("&scope={scope_part}")
  "&scope=contacts%20content%20forms%20tickets%20e-commerce"
}

#' Authorize URL for OAuth
#' @return Authorize URL (character)
#' @noRd
authorize_url <- function(app_info) {
  paste0(
    "https://app.hubspot.com/oauth/authorize?client_id=",
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
hubspot_oauth_endpoint <- function(app_info) {
  endpoint <- httr::oauth_endpoint(
    authorize = authorize_url(app_info),
    access = access_url()
  )
}

hubspot_oauth_app <- function(app_info) {
  oauth_app <- httr::oauth_app(
    appname = "MyHubSpotApp",
    key = app_info$client_id,
    secret = app_info$client_secret
  )
}


#' Create/get Hubspot authorization token.
#'
#' Functions related to creating or retrieving an OAuth 2.0
#' token for the Hubspot API.
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
#' \dontrun{
#' hubspot_token_create()
#' }
#' @rdname hubspot-oauth
hubspot_token_create <- function(app_info = default_ld_hubspot_app(),
                                 set_renv = TRUE,
                                 token_path = NULL) {
  token <- httr::oauth2.0_token(
    endpoint =
      hubspot_oauth_endpoint(app_info),
    app =
      hubspot_oauth_app(app_info),
    cache = FALSE
  )

# from https://github.com/ropensci/rtweet/blob/1bd1e16d14df8b31a13a8c2f0e0ff0e87ea066d1/R/tokens.R#L219 # nolint
  if (set_renv) {
    if (is.null(token_path)) {
      token_path <- uq_filename(file.path(home(), ".hubspot_token.rds"))
    }

    saveRDS(token, file = token_path, compress = FALSE)
    set_renv("HUBSPOT_PAT" = token_path)
  }

  return(token)
}

#' @return Either NULL or the path in which the token is saved.
#' @export
#' @rdname hubspot-oauth
#'
#' @examples
#' hubspot_token_get()
hubspot_token_get <- function() {
  token_path <- Sys.getenv("HUBSPOT_PAT")

  if (token_path == "") {
    return(NULL)
  } else {
    return(token_path)
  }
}
