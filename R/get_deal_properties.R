#' Retrieve available properties for deals
#'
#' @inheritParams get_company_properties
#'
#' @return Character vector of properties
#' @export
#' @family getters
#' @examples
#' properties <- get_deal_properties()
get_deal_properties <- function(token_path = hubspot_token_get(),
                                apikey = hubspot_key_get()) {

  get_results(path = "/properties/v1/deals/properties/",
              token_path = token_path,
              apikey = apikey) %>%
    purrr::map_chr("name")
}
