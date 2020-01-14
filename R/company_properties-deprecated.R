#' Retrieve available properties for companies
#'
#' @description Soon to be deprecated! Use `hs_company_properties_tidy()`.
#'
#' @template token_path
#' @template apikey
#'
#' @return Character vector of properties
#' @export
#' @examples
#' properties <- hs_company_properties_raw()
get_company_properties <- function(token_path = hubspot_token_get(),
                                   apikey = hubspot_key_get()) {

  .Deprecated("hs_company_properties_tidy")

  hs_company_properties_tidy(
    hs_company_properties_raw(
      token_path = token_path,
                            apikey = apikey)
  )
}
