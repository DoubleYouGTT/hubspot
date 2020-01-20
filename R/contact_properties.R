#' Contact properties endpoint (raw and tidy)
#'
#' Retrieve raw and tidy results from [the contact properties endpoint](https://developers.hubspot.com/docs/methods/contacts/v2/get_contacts_properties).
#'
#' @template token_path
#' @template apikey
#' @rdname contact-properties
#' @return List of contact properties (`hs_contact_properties_raw()`)
#' @export
#' @examples
#' properties <- hs_contact_properties_raw()
#' property_names <- hs_contact_properties_tidy(properties, view = "names")
hs_contact_properties_raw <- function(token_path = hubspot_token_get(),
                                      apikey = hubspot_key_get()) {

  get_results(
    path = "/properties/v1/contacts/properties",
    apikey = apikey,
    token_path = token_path
  )
}

# tidiers ---------------------------------------------------------
#' @template contact_properties
#' @template view
#' @details
#' Required scope(s) of the OAuth token: contacts.
#'
#' Different `view` values and associated output.
#' * "names": A character vector of the names of available contact properties.
#'
#' @return Something tidy (`hs_contact_properties_tidy()`)
#' @export
#'
#' @rdname contact-properties
hs_contact_properties_tidy <- function(contact_properties = hs_contact_properties_raw(),
                                       view = "names") {

  view <- match.arg(view, c("names"))

  switch(view,
         "names" = .contact_properties_names(contact_properties))

}

.contact_properties_names <- function(contact_properties) {
  contact_properties %>%
    purrr::map_chr("name")
}

