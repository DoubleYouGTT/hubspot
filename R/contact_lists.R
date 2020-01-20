#' Contact lists endpoint (raw and tidy)
#'
#' @description Retrieve raw and tidy results from [the contact lists endpoint](https://developers.hubspot.com/docs/methods/lists/get_lists).
#'
#' @template token_path
#' @template apikey
#' @template max_iter
#'
#' @return List of contact lists (`hs_contact_lists_raw()`)
#' @rdname contact-lists
#' @examples
#' \donttest{
#' contact_lists <- hs_contact_lists_raw()
#' hs_contact_lists_tidy(contact_lists)
#' }
#' @export
hs_contact_lists_raw <- function(token_path = hubspot_token_get(),
                                 apikey = hubspot_key_get(),
                                 max_iter = 10) {
  query <- list(
      count = 250
      )

  contacts <- get_results_paged(
    path = "/contacts/v1/lists",
    max_iter = max_iter, query = query,
    token_path = token_path,
    apikey = apikey, element = "lists",
    hasmore_name = "has-more",
    offset_name_in = "offset",
    offset_name_out = "offset"
  )

  purrr::set_names(
    contacts,
    purrr::map_dbl(contacts, "listId")
  )
}

# tidiers -----------------------------------------------------------------

#' @rdname contact-lists
#' @template contact_lists
#' @template view
#' @details
#' Required scope(s) of the OAuth token: contacts.
#'
#' Different `view` values and associated output.
#' * "names": A tibble containing all IDs and names of contact lists
#'
#' @return A tibble with associated entities (`hs_contact_lists_tidy()`)
#' @export
#'

hs_contact_lists_tidy <- function(contact_lists = hs_contact_lists_raw(),
                             view = c("names")) {

  view <- match.arg(view, c("names"))

  switch(view,
         "names" = .contact_list_names(contact_lists))

}


.contact_list_names <- function(contact_lists) {
  tibble::tibble(
    id = names(contact_lists),
    name = purrr::map_chr(contact_lists, "name")
  )
}
