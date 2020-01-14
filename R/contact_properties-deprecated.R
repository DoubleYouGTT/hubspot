#' Retrieve available properties for contacts
#'
#' @description Soon to be deprecated! Use [`hs_contact_properties_tidy()`].
#'
#' @template token_path
#' @template apikey
#'
#' @return Character vector of properties
#' @export
get_contact_properties <- function(token_path = hubspot_token_get(),
                                   apikey = hubspot_key_get()) {

  .Deprecated("hs_contact_properties_tidy")

  hs_contact_properties_tidy(hs_contact_properties_raw(
    token_path = token_path,
    apikey = apikey
  ))
}
