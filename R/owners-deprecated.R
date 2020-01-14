#' Retrieve owners
#'
#' @description Soon to be deprecated! Use [`hs_owners_raw()`].
#'
#' @details Inactive owners are defined as owners without any active remotes.
#' @template token_path
#' @template apikey
#' @template include_inactive
#' @template email
#'
#' @return List of owners
#' @export
get_owners <- function(token_path = hubspot_token_get(),
                       apikey = hubspot_key_get(),
                       include_inactive = TRUE,
                       email = NULL) {
  .Deprecated("hs_owners_raw")

  hs_owners_raw(token_path = token_path,
                apikey = apikey,
                include_inactive = include_inactive,
                email = email)
}


#' Extract a table of CRM owners
#'
#' @description Soon to be deprecated! Use `hs_owners_tidy(owners, view = "owners")`.
#'
#' @template owners
#'
#' @return tibble of owners
#' @export
#'
owners <- function(owners = hs_owners_raw()) {

  .Deprecated("hs_owners_tidy")

  .owners(owners = owners)

}
