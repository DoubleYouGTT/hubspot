#' Company properties endpoint (raw and tidy)
#'
#' Retrieve raw and tidy results from [the company properties endpoint](https://developers.hubspot.com/docs/methods/companies/get_company_properties).
#'
#' @template token_path
#' @template apikey
#' @rdname company-properties
#' @return List of company properties (`hs_company_properties_raw()`)
#' @export
#' @examples
#' properties <- hs_company_properties_raw()
#' property_names <- hs_company_properties_tidy(properties, view = "names")
hs_company_properties_raw <- function(token_path = hubspot_token_get(),
                                      apikey = hubspot_key_get()) {

  get_results(
    path = "/properties/v1/companies/properties/",
    apikey = apikey,
    token_path = token_path
  )
}

# tidiers ---------------------------------------------------------
#' @template owners
#' @template view
#' @details
#' Different `view` values and associated output.
#' * "owners": A tibble with owners and related information.
#'
#' @return Something tidy (`hs_company_properties_tidy()`)
#' @export
#'
#' @rdname company-properties
hs_company_properties_tidy <- function(company_properties = hs_company_properties_raw(),
                           view = "names") {

  view <- match.arg(view, c("names"))

  switch(view,
         "names" = .company_properties_names(company_properties))

}

.company_properties_names <- function(company_properties) {
  company_properties %>%
    purrr::map_chr("name")
}

