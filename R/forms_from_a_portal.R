#' WIP - Get all forms from a portal (raw and tidy)
#'
#' @description For a given portal, return all forms that have been created in the portal. from the [Get all forms from a portal endpoint](https://developers.hubspot.com/docs/methods/forms/v2/get_forms).
#' @details Required scope(s) for the OAuth token: forms.
#'
#' @template token_path
#' @template apikey
#' @template  all_form_types
#'
#' @return A list (`hs_forms_from_a_portal_raw()`)
#' @rdname forms_from_a_portal
#' @aliases hs_froms_from_a_portal
#' @export
#' @examples
#' \donttest{
#' hs_forms_from_a_portal_raw()
#' forms <- hs_forms_from_a_portal_tidy()
#' }

hs_forms_from_a_portal_raw <- function(token_path = hubspot_token_get(),
                                       apikey = hubspot_key_get(),
                                       all_form_types = FALSE) {
  path <- "/forms/v2/forms"

  if(all_form_types == TRUE){

    query <- list(limit = 250,
                 FormTypes = "ALL")

  } else {

    query <- list(limit = 250)

  }

  forms_from_a_portal <- get_results(path = path,
                                     apikey = apikey,
                                     token_path = token_path,
                                     query = query)
  purrr::set_names(
    forms_from_a_portal,
    purrr::map_chr(forms_from_a_portal, c("guid"))
  )

}


# tidiers -----------------------------------------------------------------
#' @rdname forms_from_a_portal
#' @aliases hs_forms_from_a_portal_tidy
#' @template forms_from_a_portal
#' @template view
#' @details
#' Different `view` values and associated output.
#' * "forms": tibble of form IDs, names, createdAt dates, upatedAt date, type, published (T/F) and number of fields
#' * "fields": tibble of all forms as above with form fields (one field per row)
#' * "options": tibble of all forms and fields as above, with options for multiple option fields (one option per row)
#'
#' @return A tibble with associated entities (`hs_forms_from_a_portal_tidy()`)
#' @export

hs_forms_from_a_portal_tidy <- function(forms_from_a_portal = hs_forms_from_a_portal_raw(),
                                        view = 'forms') {

view <- match.arg(view, c('forms','fields','options'))

switch(view,
       'forms' = .form_forms(forms_from_a_portal),
       'fields' = .form_fields(forms_from_a_portal),
       'options' = .form_options(forms_from_a_portal))
}

.form_forms <- function(forms_from_a_portal){

  formFieldGroups <- NULL

  tibble::tibble(
    guid = purrr::map_chr(forms_from_a_portal,"guid"),
    name = purrr::map_chr(forms_from_a_portal,"name"),
    createdAt = purrr::map_dbl(forms_from_a_portal,"createdAt"),
    updatedAt = purrr::map_dbl(forms_from_a_portal,"updatedAt"),
    formType = purrr::map_chr(forms_from_a_portal,"formType"),
    formFieldGroups = purrr::map(forms_from_a_portal,c("formFieldGroups")),
    isPublished = purrr::map_lgl(forms_from_a_portal,"isPublished")
  ) %>%
    epoch_converter() %>%
    dplyr::mutate(numberOfFields = purrr::map_int(.$formFieldGroups,length)) %>%
    dplyr::select(-formFieldGroups)
}

.form_fields <- function(forms_from_a_portal){

  formFieldGroups <- fields <- NULL

  tibble::tibble(
    formId = purrr::map_chr(forms_from_a_portal,"guid"),
    formName = purrr::map_chr(forms_from_a_portal,"name"),
    formCreatedAt = purrr::map_dbl(forms_from_a_portal,"createdAt"),
    formFieldGroups = purrr::map(forms_from_a_portal,"formFieldGroups")
  ) %>%
    epoch_converter() %>%
    tidyr::unnest_longer(formFieldGroups) %>%
    tidyr::hoist(formFieldGroups,
                 fields = "fields",
                 default = "default",
                 isSmartGroup = "isSmartGroup"
    ) %>%
    dplyr::mutate(fields = purrr::map(fields,1)) %>%
    tidyr::hoist(fields,
                 fieldName = "name",
                 fieldLabel = "label",
                 fieldType = "fieldType",
                 groupName = "groupName",
                 fieldRequired = "required"
    ) %>%
    dplyr::select(-formFieldGroups,-fields)
}

.form_options <- function(forms_from_a_portal){

  formFieldGroups <- fields <- fieldOptions <- NULL

  tibble::tibble(
    formId = purrr::map_chr(forms_from_a_portal,"guid"),
    formName = purrr::map_chr(forms_from_a_portal,"name"),
    formCreatedAt = purrr::map_dbl(forms_from_a_portal,"createdAt"),
    formFieldGroups = purrr::map(forms_from_a_portal,"formFieldGroups")
  ) %>%
    epoch_converter() %>%
    tidyr::unnest_longer(formFieldGroups) %>%
    tidyr::hoist(formFieldGroups,
                 fields = "fields"
    ) %>%
    dplyr::mutate(fields = purrr::map(fields,1)) %>%
    tidyr::hoist(fields,
                 fieldName = "name",
                 fieldLabel = "label",
                 fieldType = "fieldType",
                 groupName = "groupName",
                 fieldRequired = "required",
                 fieldOptions = "options"
    ) %>%
    dplyr::select(-formFieldGroups,-fields) %>%
    tidyr::unnest_longer(fieldOptions) %>%
    dplyr::mutate(fieldOptions = purrr::map_chr(fieldOptions,1))
}
