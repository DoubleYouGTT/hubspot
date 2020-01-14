#' Retrieve available properties for deals
#'
#' @description Soon to be deprecated! Use [`hs_deal_properties_tidy()`].
#'
#' @template token_path
#' @template apikey
#'
#' @return Character vector of properties
#' @export
get_deal_properties <- function(token_path = hubspot_token_get(),
                                   apikey = hubspot_key_get()) {

  .Deprecated("hs_deal_properties_tidy")

  hs_deal_properties_tidy(hs_deal_properties_raw(
    token_path = token_path,
    apikey = apikey
  ))
}
