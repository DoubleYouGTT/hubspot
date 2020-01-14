#' Get a list of all contacts, including a set of properties
#'
#' @description Soon to be deprecated! Use `hs_contacts_raw()`.
#'
#' @template token_path
#' @template apikey
#' @template properties
#' @template property_history
#' @template form_submission_mode
#' @template list_memberships
#' @template max_iter
#' @template max_properties
#'
#' @return List with contact data
#' @export
get_contacts <- function(token_path = hubspot_token_get(),
                         apikey = hubspot_key_get(),
                         properties = get_contact_properties(
                           token_path =
                             token_path,
                           apikey =
                             apikey
                         ),
                         property_history = "true",
                         form_submission_mode = "newest",
                         list_memberships = "false",
                         max_iter = 10,
                         max_properties = 100) {

  .Deprecated("hs_contacts_raw")

  hs_contacts_raw(token_path = token_path,
                  apikey = apikey,
                  properties = properties,
                  property_history = property_history,
                  form_submission_mode = form_submission_mode,
                  list_memberships = list_memberships,
                  max_iter = max_iter,
                  max_properties = max_properties)
}

#' Extract a table of contact IDs and simple property values
#'
#' @description Soon to be deprecated! Use `hs_contacts_tidy(contacts, view = "properties")`.
#'
#' @template contacts
#'
#' @return A tibble with associated entities
#' @export
#'
contact_properties <- function(contacts = hs_contacts_raw()) {

  .Deprecated("hs_contacts_tidy")

  .contact_properties(contacts = contacts)

}

