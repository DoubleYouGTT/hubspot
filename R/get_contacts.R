#' Get a list of all contacts, including a set of properties
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
#' @family getters
#' @examples
#' contacts <- get_contacts(
#'   property_history = "false", max_iter = 1,
#'   max_properties = 10
#' )
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
