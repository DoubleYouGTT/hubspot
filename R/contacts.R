#' Contacts endpoint, raw and tidy
#'
#' Get raw and tidy results from the [contacts endpoint](https://developers.hubspot.com/docs/methods/contacts/get_contacts).
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
#' @return List with contact data (`hs_contacts_raw()`)
#' @export
#' @rdname contacts
#' @examples
#' contacts <- hs_contacts_raw(
#'   property_history = "false", max_iter = 1,
#'   max_properties = 10
#' )
#' contacts_properties <- hs_contacts_tidy(
#'   contacts,
#'   view = "properties"
#' )
hs_contacts_raw <- function(token_path = hubspot_token_get(),
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
  form_submission_mode <- match.arg(
    form_submission_mode,
    c("all", "none", "newest", "oldest")
  )

  properties <- head(properties, max_properties)

  query <- c(
    list(
      count = 100,
      propertyMode = ifelse(property_history == "true",
                            "value_and_history", "value_only"
      ),
      formSubmissionMode = form_submission_mode,
      showListMemberships = list_memberships
    ),
    purrr::set_names(
      lapply(properties, function(x) {
        x
      }),
      rep("property", length(properties))
    )
  )

  contacts <- get_results_paged(
    path = "/contacts/v1/lists/all/contacts/all",
    max_iter = max_iter, query = query,
    token_path = token_path,
    apikey = apikey, element = "contacts",
    hasmore_name = "has-more",
    offset_name_in = "vidOffset",
    offset_name_out = "vid-offset"
  )

  purrr::set_names(
    contacts,
    purrr::map_dbl(contacts, "vid")
  )
}

# tidiers -----------------------------------------------------------------

#' @template contacts
#' @template view
#' @details
#' Different `view` values and associated output.
#' * "properties": A tibble containing all properties of contacts
#'
#' @export
#'
#' @rdname contacts
#'
#' @return A tibble with associated entities (`hs_contacts_tidy()`)
#' @export
#'

hs_contacts_tidy <- function(contacts = hs_contacts_raw(),
                              view = c("properties")) {

  view <- match.arg(view, c("properties"))

  switch(view,
         "properties" = .contact_properties(contacts))

}


.contact_properties <- function(contacts) {
  contacts %>%
    purrr::map("properties") %>%
    purrr::modify_depth(2, ~ .$value) %>%
    purrr::map_df(tibble::as_tibble, .id = "vid") %>%
    numeric_converter() %>%
    epoch_converter()
}
