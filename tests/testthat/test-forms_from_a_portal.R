all_form_types <- FALSE

vcr::use_cassette("hs_forms_from_a_portal_raw", {

  test_that("hs_forms_from_a_portal_raw works", {

    expect_is(hs_forms_from_a_portal_raw(), "list")

  })

})

vcr::use_cassette("hs_forms_from_a_portal_tidy", {
  test_that("hs_forms_from_a_portal_tidy works", {
    res <- hs_forms_from_a_portal_tidy(view = "forms")
    expect_is(res, "tbl_df")
    expect_true(all(names(res) == c("guid","name","createdAt","updatedAt","formType","isPublished","numberOfFields")))
  })
})

vcr::use_cassette("hs_forms_from_a_portal_tidy", {
  test_that("hs_forms_from_a_portal_tidy fields works", {
    res <- hs_forms_from_a_portal_tidy(view = "fields")
    expect_is(res, "tbl_df")
    expect_true(all(names(res) == c("formId", "formName", "formCreatedAt", "fieldName", "fieldLabel", "fieldType", "groupName", "fieldRequired", "default", "isSmartGroup")))
  })
})



vcr::use_cassette("hs_forms_from_a_portal_tidy", {
  test_that("hs_forms_from_a_portal_tidy options works", {
    res <- hs_forms_from_a_portal_tidy(view = "options")
    expect_is(res, "tbl_df")
    expect_true(all(names(res) == c("formId","formName","formCreatedAt","fieldName","fieldLabel","fieldType","groupName","fieldRequired","fieldOptions")))
  })
})
