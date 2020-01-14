vcr::use_cassette("get_contacts", {
  test_that("get_contacts works", {
    res <- suppressWarnings(
      get_contacts(max_iter = 1, max_properties = 1)
    )
    expect_is(res, "list")
  })

  test_that("get_contacts gets warning", {
    expect_warning(
      get_contacts(max_iter = 1, max_properties = 1),
      "deprecated"
    )
  })
})

vcr::use_cassette("contact_properties", {
  test_that("contact_properties works", {
    res <- suppressWarnings(
      contact_properties()
    )
    expect_is(res, "tbl_df")
    expect_gt(ncol(res), 3)
  })

  test_that("contact_properties gets warning", {
    expect_warning(
      contact_properties(),
    "deprecated")
  })
})

